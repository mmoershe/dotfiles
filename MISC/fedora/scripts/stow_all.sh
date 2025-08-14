#!/bin/bash
set -e # Exit on error

stow_all() {
    echo
    echo "[ ] Stowing dotfiles..."

    DOTFILES=(
        bash
        kitty
        starship
        tmux
        wofi
        sway
        waybar
    )

    SCRIPTS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    FEDORA_DIRECTORY="$(dirname "${SCRIPTS_DIRECTORY}")"
    MISC_DIRECTORY="$(dirname "${FEDORA_DIRECTORY}")"
    DOTFILES_DIRECTORY="$(dirname "${MISC_DIRECTORY}")"

    rm -f ~/.bashrc

    for pkg in "${DOTFILES[@]}"; do
        (
            cd ${DOTFILES_DIRECTORY}
            stow ${pkg}
        )
        echo "    [✓] stowed "$pkg""
    done
    echo "[✓] Dotfiles symlinked."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    stow_all
fi
