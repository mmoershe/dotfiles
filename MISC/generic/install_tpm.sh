#!/bin/bash
set -e # Exit on error

install_tpm() {
    # https://github.com/tmux-plugins/tpm

    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "TPM already exists"
    else
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi

    if [ -d "$HOME/.config/tmux/plugins/catppuccin/tmux" ]; then
        echo "Catppuccin TMUX Theme already exists"
    else
        mkdir -p ~/.config/tmux/plugins/catppuccin
        git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_tpm
fi
