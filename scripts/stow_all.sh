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
    )

    SCRIPTS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DOTFILES_DIRECTORY="$(dirname "${SCRIPTS_DIRECTORY}")"

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
