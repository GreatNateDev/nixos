#!/usr/bin/env bash

# Usage: ./script.sh @handle

if [ -z "$1" ]; then
  echo "Usage: $0 <YouTube handle>"
  exit 1
fi

HANDLE="${1#@}"

# Search YouTube for the channel handle, grab first video result URL
SEARCH_HTML=$(curl -sG "https://www.youtube.com/results" \
  --data-urlencode "search_query=$HANDLE")

VIDEO_URL=$(echo "$SEARCH_HTML" \
  | grep -oP '/watch\?v=[A-Za-z0-9_-]+' \
  | head -n1)

if [ -z "$VIDEO_URL" ]; then
  echo "No video found for handle: $HANDLE"
  exit 1
fi

FULL_URL="https://www.youtube.com${VIDEO_URL}"

# Fetch video page
VIDEO_HTML=$(curl -sL "$FULL_URL")

# Extract uploader channel ID (UC...)
CHANNEL_ID=$(echo "$VIDEO_HTML" \
  | grep -Po '"channelId":"\KUC[A-Za-z0-9_-]+' \
  | head -n1)

if [ -z "$CHANNEL_ID" ]; then
  echo "Failed to extract channel ID"
  exit 1
fi

RSS_URL="https://www.youtube.com/feeds/videos.xml?channel_id=$CHANNEL_ID"

echo -n "$RSS_URL" | wl-copy

echo "Copied to clipboard:"
echo "$RSS_URL"
