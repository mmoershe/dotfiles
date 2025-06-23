#!/bin/bash
set -e # Exit on error

install_fonts() {
    echo
    echo "[ ] Installing fonts..."

    SCRIPTS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DOTFILES_DIRECTORY="$(dirname "${SCRIPTS_DIRECTORY}")"
    MISC_DIRECTORY="${DOTFILES_DIRECTORY}/MISC"

    FONTS_DIRECTORY="${MISC_DIRECTORY}/fonts"
    FONT_DEST="$HOME/.local/share/fonts"

    mkdir -p "$FONT_DEST"
    find "$FONTS_DIRECTORY" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp {} "$FONT_DEST" \;
    fc-cache -fv "$FONT_DEST"

    echo "[+] Fonts installed."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_fonts
fi
