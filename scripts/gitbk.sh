rm -rf *
EXCLUDE="" # In format Owner/Repo
gh repo list GreatNateDev --limit 1000 --json nameWithOwner,isFork -q '.[] | select(.isFork == false) | .nameWithOwner' | \
grep -Ev "$EXCLUDE" | \
xargs -L1 gh repo clone
