#!/usr/bin/env bash

set -e # Exit on error

NVIM_CONFIG_DIR="$HOME/.config/nvim"
NVIM_CONFIG_REPO="https://github.com/mmoershe/config.nvim"

if [ -d "$HOME/.config/nvim" ]; then
    echo "Neovim-Config already exists. Pulling changes..."
    git -C "$NVIM_CONFIG_DIR" pull --ff-only
else
    echo "Cloning Neovim config..."
    git clone "$NVIM_CONFIG_REPO" "$NVIM_CONFIG_DIR"
fi
