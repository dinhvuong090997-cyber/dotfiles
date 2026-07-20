#!/bin/sh
# Record a selected region with wf-recorder
DIR=~/Videos/recordings
mkdir -p "$DIR"
FILE="$DIR/rec-$(date +%Y%m%d-%H%M%S).mp4"
slurp | xargs -r wf-recorder -g "$(cat)" -f "$FILE" -c libx264
