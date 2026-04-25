#!/bin/bash

install_nvim_config() {
    if [[ -d "$HOME/.config/nvim" ]]; then
        echo "You already have a Neovim config installed. Exiting"
        return
    fi

    git clone https://github.com/mmoershe/config.nvim "$HOME/.config/nvim"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_nvim_config
fi
