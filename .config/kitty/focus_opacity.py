from kitty.fast_data_types import change_background_opacity
from kitty.boss import Boss
from kittens.tui.handler import result_handler
import subprocess

def on_focus_change(boss, window, data):
    try:
        focused = data.get('focused', False)
        if focused:
            change_background_opacity(window.os_window_id, 0.95)
        else:
            change_background_opacity(window.os_window_id, 0.55)
    except Exception:
        pass
