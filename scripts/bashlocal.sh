#!/bin/bash

# Check if songs.txt exists
if [ ! -f songs.txt ]; then
    echo "❌ songs.txt not found!"
    exit 1
fi

# Loop through each URL in the file
while IFS= read -r url; do
    if [[ $url == https://www.youtube.com/watch\?v=* ]]; then
        echo "▶️ Loading: $url"
        ./songloader.sh "$url"
    else
        echo "⚠️ Skipping invalid line: $url"
    fi
done < songs.txt
