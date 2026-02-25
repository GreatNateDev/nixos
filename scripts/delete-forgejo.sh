# ⚠️ WARNING: This will permanently delete ALL repositories for GreatNateDev on http://code
ENV_NIX="$HOME/.config/nixos/nix/env.nix"
FORGEJO_TOKEN=$(nix eval --raw -f "$ENV_NIX" gitkey)
FORGEJO_URL="http://code"
FORGEJO_USER="GreatNateDev"

# Fetch all repos
repos=$(curl -s -H "Authorization: token $FORGEJO_TOKEN" \
  "$FORGEJO_URL/api/v1/users/$FORGEJO_USER/repos?limit=200" |
  jq -r '.[].name')

echo "About to delete the following repositories:"
echo "$repos"
echo
read -p "Type YES to confirm: " confirm

if [ "$confirm" != "YES" ]; then
  echo "Aborted."
  exit 1
fi

# Delete each repo
for repo in $repos; do
  echo "Deleting $repo..."
  curl -s -X DELETE "$FORGEJO_URL/api/v1/repos/$FORGEJO_USER/$repo" \
    -H "Authorization: token $FORGEJO_TOKEN"
done

echo "All repositories deleted."
