#!/usr/bin/env zsh

# -----------------------
# Load config from env.nix
# -----------------------
ENV_NIX="$HOME/.config/nixos/nix/env.nix"

folder=$(nix eval --raw -f "$ENV_NIX" folder)
wallpass=$(nix eval --raw -f "$ENV_NIX" wallpass)

WALLPAPER_DIR="$HOME/.config/nixos/data/$folder"
STATE_FILE="/tmp/awww_current_index"
UNLOCK_FILE="/tmp/awww_wallpaper_unlocked_until"

# -----------------------
# Optional password gate
# -----------------------
if [[ -n "$wallpass" ]]; then
  now=$(date +%s)

  if [[ -f "$UNLOCK_FILE" ]]; then
    unlock_until=$(<"$UNLOCK_FILE")
  else
    unlock_until=0
  fi

  if (( now >= unlock_until )); then
    entered=$(zenity \
      --entry \
      --title="Wallpaper Switching Locked" \
      --text="Enter password to unlock (30 seconds)" \
      --hide-text)

    # Cancel pressed
    [[ -z "$entered" ]] && exit 0

    if [[ "$entered" != "$wallpass" ]]; then
      zenity --error \
        --title="Access Denied" \
        --text="Incorrect password."
      exit 1
    fi

    # Unlock for 30 seconds
    echo $(( now + 30 )) > "$UNLOCK_FILE"

    zenity --info \
      --title="Unlocked" \
      --text="Wallpaper switching unlocked for 30 seconds."
  fi
fi

# -----------------------
# Wallpaper logic
# -----------------------
files=("${(@f)$(find "$WALLPAPER_DIR" -type f \( \
  -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o \
  -iname "*.gif" -o -iname "*.mp4" -o -iname "*.webm" -o \
  -iname "*.mkv" -o -iname "*.webp" \
\) | sort)}")

if (( ${#files[@]} == 0 )); then
  zenity --error \
    --title="No Wallpapers" \
    --text="No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

if [[ -f "$STATE_FILE" ]]; then
  current_index=$(<"$STATE_FILE")
else
  current_index=0
fi

current_wallpaper="${files[$current_index+1]}"

awww img "$current_wallpaper"

next_index=$(( (current_index + 1) % ${#files[@]} ))
echo "$next_index" > "$STATE_FILE"
