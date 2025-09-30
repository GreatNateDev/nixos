pid=""
while true; do
    swaybg -i "$(find "/home/nate/.config/nixos/data/bg" -type f | shuf -n1)" -m fill &
    newpid=$!
    if [ -n "$pid" ]; then
        sleep 0.5
        kill "$pid" || true
    fi
    pid=$newpid
    sleep 30
done