#!/bin/bash

stow_all() {
    echo "[ ] Stowing dotfiles..."

    SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    BASE_DIR="$SCRIPTS_DIR/.."

    cd "$BASE_DIR/stow_packages" && stow --target ~ */

    echo "[✓] Stowing dotfiles..."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    stow_all
fi
