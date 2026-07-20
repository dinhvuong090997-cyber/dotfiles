#!/bin/sh
# Set random wallpaper from wallhaven anime scenery collection
WALLDIR=~/Pictures/wallhaven-anime-scenery
WALL1=$(find "$WALLDIR" -type f | shuf -n1)
WALL3=$(find "$WALLDIR" -type f | shuf -n1)
# HDMI-A-1: main 1080p
noctalia msg wallpaper-set HDMI-A-1 "$WALL1"
# HDMI-A-3: portrait
if [ -n "$WALL3" ]; then
    noctalia msg wallpaper-set HDMI-A-3 "$WALL3"
fi
