 gh repo list GreatNateDev --limit 1000 --json nameWithOwner -q '.[].nameWithOwner' | xargs -L1 gh repo clone
