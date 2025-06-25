#!/bin/bash
set -e # Exit on error

install_packages_pacman() {
    echo "[ ] Installing pacman packages..."

    CURRENT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PACKAGE_FILE="${CURRENT_DIRECTORY}/packages_pacman.txt"

    PACKAGES=($(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE"))

    sudo pacman -S "${PACKAGES[@]}" --noconfirm

    echo "[+] Packages installed."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_packages_pacman
fi
