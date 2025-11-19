#!/usr/bin/env zsh

# Get current fullscreen_opacity value
current=$(hyprctl getoption decoration:fullscreen_opacity | grep float | awk '{print $2}')

# Toggle between 0.85 and 1.0
if [[ "$current" == "1.000000" ]] || [[ "$current" == "1.0" ]]; then
  hyprctl keyword decoration:fullscreen_opacity 0.85
  notify-send "Fullscreen Opacity" "Enabled (85%)" -t 2000
else
  hyprctl keyword decoration:fullscreen_opacity 1.0
  notify-send "Fullscreen Opacity" "Disabled (100%)" -t 2000
fi
