rm -rf *
EXCLUDE="" # e.g., "GreatNateDev/Repo1|GreatNateDev/Repo2"
gh repo list GreatNateDev --limit 1000 --json nameWithOwner,isFork -q '.[] | select(.isFork == false) | .nameWithOwner' | \
{
  if [ -n "$EXCLUDE" ]; then
    grep -Ev "$EXCLUDE"
  else
    cat
  fi
} | \
xargs -P4 -L1 gh repo clone
