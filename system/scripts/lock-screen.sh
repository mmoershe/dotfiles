#!/usr/bin/env bash

set -e

pidof hyprlock || hyprlock &

pkill -f "alacritty --class Screensaver"
