#!/bin/bash
# Play YouTube audio-only or control playback
# Usage: play-yt-audio.sh [URL] [next|prev|pause|stop]

SOCKET=/tmp/mpv-audio-socket
CMD="${1:-play}"

# ---- Playback controls (no URL) ----
case "$CMD" in
    next)
        echo 'playlist-next' | socat - "$SOCKET" 2>/dev/null && notify-send "⏭ MPV" "Bài tiếp" && exit 0
        ;;
    prev|previous)
        echo 'playlist-prev' | socat - "$SOCKET" 2>/dev/null && notify-send "⏮ MPV" "Bài trước" && exit 0
        ;;
    pause|toggle)
        echo 'cycle pause' | socat - "$SOCKET" 2>/dev/null && exit 0
        ;;
    stop|quit)
        echo 'quit' | socat - "$SOCKET" 2>/dev/null && notify-send "⏹ MPV" "Đã dừng" && exit 0
        ;;
esac

# ---- Play new URL ----
URL="$CMD"
# If no URL given, try clipboard
if [[ ! "$URL" =~ ^https?:// ]]; then
    URL=$(wl-paste)
fi
if [ -z "$URL" ] || [[ ! "$URL" =~ ^https?:// ]]; then
    notify-send -u critical "MPV" "❌ Không có URL"
    exit 1
fi

# Kill old instance
pkill -f "mpv --no-video" 2>/dev/null
sleep 0.3

mpv --no-video \
    --ytdl-format=bestaudio \
    --volume=80 \
    --really-quiet \
    --input-ipc-server="$SOCKET" \
    "$URL" &

disown
notify-send "🎵 MPV" "Đang phát: ${URL##*/}"
