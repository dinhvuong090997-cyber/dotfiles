#!/bin/bash
# Combined brightness + nightlight control
# Mod+B opens a menu: Brightness slider or Nightlight toggle

choice=$(zenity --list \
    --title="Display Controls" \
    --text="Choose action:" \
    --column="Action" \
    "☀ Brightness Slider" \
    "🌙 Toggle Nightlight" \
    --width=300 --height=200 2>/dev/null)

case "$choice" in
    "☀ Brightness Slider")
        ~/.local/bin/brightness-slider.sh
        ;;
    "🌙 Toggle Nightlight")
        export WAYLAND_DISPLAY=wayland-1 XDG_RUNTIME_DIR=/run/user/1000
        state=$(noctalia msg nightlight-force-toggle 2>&1)
        ;;
esac
