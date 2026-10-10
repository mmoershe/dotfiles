#!/bin/bash

stow_all() {
    echo "[ ] Stowing dotfiles..."

    SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    BASE_DIR="$SCRIPTS_DIR/.."

    # A fresh install ships a regular ~/.bashrc, which stow refuses to replace.
    # Once stowed it is a symlink, so this only triggers on the first run.
    if [[ -f ~/.bashrc && ! -L ~/.bashrc ]]; then
        echo "Moving existing ~/.bashrc to ~/.bashrc.bak"
        mv ~/.bashrc ~/.bashrc.bak
    fi

    cd "$BASE_DIR/stow_packages" && stow --verbose --target ~ */

    echo "[✓] Stowing dotfiles..."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    stow_all
fi
