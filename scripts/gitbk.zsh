gitname="GreatNateDev" # Change to your user
rm -rf *
EXCLUDE="" # e.g., "gitname/Repo1|gitname/Repo2"
gh repo list $gitname --limit 1000 --json nameWithOwner,isFork -q '.[] | select(.isFork == false) | .nameWithOwner' | \
{
  if [ -n "$EXCLUDE" ]; then
    grep -Ev "$EXCLUDE"
  else
    cat
  fi
} | \
xargs -P4 -L1 gh repo clone
