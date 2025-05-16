#!/bin/bash

stow_all() {
    echo
    echo "[ ] Stowing dotfiles..."

    DOTFILES=(
        bash
        kitty
        starship
        tmux
    )

    cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    rm -f ~/.bashrc

    for pkg in "${DOTFILES[@]}"; do
        stow "$pkg"
        echo "    [✓] stowed "$pkg""
    done
    echo "[+] Dotfiles symlinked."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    stow_all
fi
