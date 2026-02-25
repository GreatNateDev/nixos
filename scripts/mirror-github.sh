ENV_NIX="$HOME/.config/nixos/nix/env.nix"
FORGEJO_TOKEN=$(nix eval --raw -f "$ENV_NIX" gitkey)
FORGEJO_URL="http://code"
FORGEJO_USER="GreatNateDev"
# Fetch private and public repos
private_repos=$(gh repo list --visibility private --limit 1000 --json nameWithOwner -q '.[].nameWithOwner')
public_repos=$(gh repo list --visibility public --limit 1000 --json nameWithOwner -q '.[].nameWithOwner')

# Combine lists
repos=$(echo -e "$private_repos\n$public_repos")

# Loop over each repo
for repo in $repos; do
  name=$(basename "$repo")
  echo "Creating mirror for $repo..."

  # Determine visibility for Forgejo
  if echo "$private_repos" | grep -q "^$repo$"; then
    private=true
  else
    private=false
  fi

  curl -s -X POST "$FORGEJO_URL/api/v1/repos/migrate" \
    -H "Authorization: token $FORGEJO_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
      \"clone_addr\": \"https://github.com/$repo.git\",
      \"repo_name\": \"$name\",
      \"mirror\": true,
      \"private\": $private,
      \"auth_username\": \"$(gh api user -q .login)\",
      \"auth_password\": \"$(gh auth token)\"
    }"

  echo "Done: $name"
done
