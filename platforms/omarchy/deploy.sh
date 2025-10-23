#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles/platforms/omarchy"
TARGET_DIR="$HOME"

rm "$TARGET_DIR/.bashrc"
stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" bash

rm  "$TARGET_DIR/.config/hypr/monitors.conf"
stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" hypr
