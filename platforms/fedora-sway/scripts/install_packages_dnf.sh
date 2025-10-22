#!/bin/bash
set -e # Exit on error

install_packages_dnf() {
    echo
    echo "[ ] Installing dnf packages..."

    SCRIPTS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DOTFILES_DIRECTORY="$(dirname "${SCRIPTS_DIRECTORY}")"
    PACKAGE_FILE="${DOTFILES_DIRECTORY}/packages_dnf.txt"

    PACKAGES=($(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE"))

    sudo dnf install -y "${PACKAGES[@]}"

    echo "[+] Packages installed."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_packages_dnf
fi
