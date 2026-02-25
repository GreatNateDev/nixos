#!/usr/bin/env zsh
# YouTube Music Downloader with metadata
# Usage: ./script.sh [--list] [--auto] <URL>

PLAYLIST_MODE=false
AUTO_MODE=false
VERBOSE=false
URL=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --list)
            PLAYLIST_MODE=true
            shift
            ;;
        --auto)
            AUTO_MODE=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            URL="$1"
            shift
            ;;
    esac
done

# Check if URL is provided
if [ -z "$URL" ]; then
    echo "Error: No URL provided"
    echo "Usage: $0 [--list] [--auto] '<URL>'"
    echo "  --list: Download entire playlist"
    echo "  --auto: Use automatic metadata from YouTube"
    echo "Note: Wrap URL in single quotes to prevent shell escaping"
    exit 1
fi

# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "Error: yt-dlp is not installed"
    exit 1
fi

# Check if id3v2 is installed
if ! command -v id3v2 &> /dev/null; then
    echo "Error: id3v2 is not installed"
    exit 1
fi

# Create output directory
OUTPUT_DIR="./downloads"
mkdir -p "$OUTPUT_DIR"

# Download function
download_and_tag() {
    local url="$1"
    
    if [ "$PLAYLIST_MODE" = true ]; then
        echo "Downloading playlist..."
        
        if [ "$AUTO_MODE" = true ]; then
            # Auto mode: download entire playlist with automatic metadata
            yt-dlp \
                --extract-audio \
                --audio-format mp3 \
                --audio-quality 0 \
                --embed-thumbnail \
                --no-write-thumbnail \
                --convert-thumbnails jpg \
                --output "$OUTPUT_DIR/%(title)s.%(ext)s" \
                --exec 'id3v2 --artist "%(channel)s" --album "%(channel)s" "%(filepath)s"' \
                "$url"
        else
            # Interactive mode: get list of videos first, then download one by one
            echo "Fetching playlist information..."
            
            # Get list of video URLs in the playlist
            VIDEO_URLS=($(yt-dlp --flat-playlist --get-id "$url" | while read id; do echo "https://www.youtube.com/watch?v=$id"; done))
            
            TOTAL=${#VIDEO_URLS[@]}
            CURRENT=0
            
            for video_url in "${VIDEO_URLS[@]}"; do
                CURRENT=$((CURRENT + 1))
                echo ""
                echo "=== Downloading track $CURRENT of $TOTAL ==="
                
                # Get video info
                VIDEO_TITLE=$(yt-dlp --get-title --no-playlist "$video_url")
                VIDEO_CHANNEL=$(yt-dlp --get-filename -o "%(channel)s" --no-playlist "$video_url")
                
                echo "YouTube Title: $VIDEO_TITLE"
                echo "YouTube Channel: $VIDEO_CHANNEL"
                
                # Prompt for metadata
                echo ""
                read "ARTIST?Artist: "
                read "TITLE?Title: "
                
                # Download the file
                yt-dlp \
                    --extract-audio \
                    --audio-format mp3 \
                    --audio-quality 0 \
                    --embed-thumbnail \
                    --no-write-thumbnail \
                    --convert-thumbnails jpg \
                    --output "$OUTPUT_DIR/%(title)s.%(ext)s" \
                    --no-playlist \
                    "$video_url"
                
                # Find the downloaded file (most recent mp3 in output dir)
                DOWNLOADED_FILE=$(ls -t "$OUTPUT_DIR"/*.mp3 | head -1)
                
                # Tag the file
                id3v2 --artist "$ARTIST" --song "$TITLE" --album "$ARTIST" "$DOWNLOADED_FILE"
                
                echo "Tagged: $(basename "$DOWNLOADED_FILE")"
            done
        fi
    else
        echo "Downloading single song..."
        
        if [ "$AUTO_MODE" = true ]; then
            # Auto mode: use YouTube metadata
            yt-dlp \
                --extract-audio \
                --audio-format mp3 \
                --audio-quality 0 \
                --embed-thumbnail \
                --no-write-thumbnail \
                --convert-thumbnails jpg \
                --output "$OUTPUT_DIR/%(title)s.%(ext)s" \
                --exec 'id3v2 --artist "%(channel)s" --album "%(channel)s" "%(filepath)s"' \
                --no-playlist \
                "$url"
        else
            # Interactive mode: prompt for metadata
            VIDEO_TITLE=$(yt-dlp --get-title --no-playlist "$url")
            VIDEO_CHANNEL=$(yt-dlp --get-filename -o "%(channel)s" --no-playlist "$url")
            
            echo ""
            echo "YouTube Title: $VIDEO_TITLE"
            echo "YouTube Channel: $VIDEO_CHANNEL"
            echo ""
            read "ARTIST?Artist: "
            read "TITLE?Title: "
            
            # Download
            yt-dlp \
                --extract-audio \
                --audio-format mp3 \
                --audio-quality 0 \
                --embed-thumbnail \
                --no-write-thumbnail \
                --convert-thumbnails jpg \
                --output "$OUTPUT_DIR/%(title)s.%(ext)s" \
                --no-playlist \
                "$url"
            
            # Find the downloaded file (most recent mp3 in output dir)
            DOWNLOADED_FILE=$(ls -t "$OUTPUT_DIR"/*.mp3 | head -1)
            
            # Tag the file
            id3v2 --artist "$ARTIST" --song "$TITLE" --album "$ARTIST" "$DOWNLOADED_FILE"
            
            echo "Tagged: $(basename "$DOWNLOADED_FILE")"
        fi
    fi
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "Download complete! Files saved to $OUTPUT_DIR"
    else
        echo "Error: Download failed"
        exit 1
    fi
}

# Run download
download_and_tag "$URL"
