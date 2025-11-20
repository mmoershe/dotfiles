#!/usr/bin/env bash

set -e # Exit on error

if [ -d "$HOME/.config/nvim" ]; then
    echo "Neovim-Config already exists."
    # maybe update the config (pull)
else
    git clone https://github.com/mmoershe/config.nvim "$HOME/.config/nvim"
fi
