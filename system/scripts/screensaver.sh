#!/usr/bin/env bash

set -e

screensaver_in_focus() {
    hyprctl activewindow -j | jq -e '.class == "Screensaver"' >/dev/null 2>&1
}

exit_screensaver() {
    hyprctl keyword cursor:invisible false
    pkill -x tte 2>/dev/null
    pkill -f "alacritty --class Screensaver" 2>/dev/null
    exit 0
}

while true; do
    tte -i ~/.config/branding.txt --frame-rate 100 --anchor-canvas c --anchor-text c --canvas-width 0 randomsequence
    while pgrep -x tte >/dev/null; do
        if read -n 1 -t 3 || ! screensaver_in_focus; then
            exit_screensaver
        fi
    done
done

hyprctl keyword cursor:invisible true &>/dev/null
