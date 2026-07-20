#!/bin/sh
# Record portrait region for TikTok (HDMI-A-3 rotated)
DIR=~/Videos/recordings
mkdir -p "$DIR"
FILE="$DIR/tiktok-$(date +%Y%m%d-%H%M%S).mp4"
wf-recorder -o HDMI-A-3 -f "$FILE" -c libx264 --geometry "1080x1920"
