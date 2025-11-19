# Configuration
folder=$(nix eval --raw -f $HOME/.config/nixos/nix/env.nix folder)
WALLPAPER_DIR="$HOME/.config/nixos/data/$folder"  # Change this to your wallpaper folder
STATE_FILE="/tmp/awww_current_index"

# Get all image and video files, sorted
files=("${(@f)$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.mp4" -o -iname "*.webm" -o -iname "*.mkv" -o -iname "*.webp" \) | sort)}")

# Check if we found any files
if [ ${#files[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Read current index, default to 0 if file doesn't exist
if [ -f "$STATE_FILE" ]; then
    current_index=$(cat "$STATE_FILE")
else
    current_index=0
fi

# Get the current wallpaper
current_wallpaper="${files[$current_index+1]}"  # zsh arrays are 1-indexed

# Set the wallpaper
awww img "$current_wallpaper"

echo "Set wallpaper: $(basename "$current_wallpaper")"

# Increment index and wrap around if necessary
next_index=$(( (current_index + 1) % ${#files[@]} ))

# Save the next index for next run
echo "$next_index" > "$STATE_FILE"
