#!/bin/bash

if pgrep -x "wofi" >/dev/null; then
    # If Wofi is already running, kill it
    pkill -x wofi
else
    # If not running, launch Wofi
    wofi --show drun
fi
