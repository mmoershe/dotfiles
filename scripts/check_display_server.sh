#!/bin/bash

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "Your system is using Wayland."
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    echo "Your system is using X11."
else
    echo "Could not determine display server (X11 or Wayland)."
fi
