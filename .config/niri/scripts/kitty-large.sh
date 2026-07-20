#!/bin/sh
# Launch kitty with large font and move to left monitor (ARZOPA)
kitty --config ~/.config/kitty/kitty-large.conf &
sleep 0.5
niri msg action move-column-to-monitor-left
