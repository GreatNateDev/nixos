#!/usr/bin/env bash
# simple_ssh_try.sh
# Usage: ./simple_ssh_try.sh ips.txt

IPFILE="$1"
USER="${USER:deck}"   # or set SSH_USER env var

while read -r ip; do
  [[ -z "$ip" ]] && continue
  echo "Trying $ip..."
  timeout 5 ssh -o ConnectTimeout=3 -o BatchMode=yes -o StrictHostKeyChecking=no \
    "$USER@$ip" "hostname" && echo "✅ $ip OK" || echo "❌ $ip failed"
done < "$IPFILE"
