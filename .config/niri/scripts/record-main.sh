#!/bin/sh
# Record main monitor (HDMI-A-1)
DIR=~/Videos/recordings
mkdir -p "$DIR"
FILE="$DIR/rec-$(date +%Y%m%d-%H%M%S).mp4"
wf-recorder -o HDMI-A-1 -f "$FILE" -c libx264
