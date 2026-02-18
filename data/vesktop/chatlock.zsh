#!/usr/bin/env zsh
ENV_NIX="$HOME/.config/nixos/nix/env.nix"
pass=$(nix eval --raw -f "$ENV_NIX" chatpass)
if [[ -n "$pass" ]]; then
  entered=$(zenity \
    --entry \
    --title="Chat is locked" \
    --text="Enter password to unlock." \
    --hide-text)
  [[ -z "$entered" ]] && exit 0
  if [[ "$entered" != "$pass" ]]; then
    zenity --error \
      --title="Access Denied" \
      --text="Incorrect password."
    exit 1
  fi
  zenity --info \
    --title="Unlocked" \
    --text="Opening Chat."
  vesktop
fi
if [[ -z "$pass" ]]; then
  vesktop
  exit
fi
