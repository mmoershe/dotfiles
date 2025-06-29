#!/bin/bash
set -e # Exit on error

install_fonts() {
    echo
    echo "[ ] Installing fonts..."

    GENERIC_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    FONTS_DIRECTORY="${GENERIC_DIRECTORY}/fonts"
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
