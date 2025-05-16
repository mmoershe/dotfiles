#!/bin/bash

install_packages_dnf() {
    echo
    echo "[ ] Installing dnf packages..."

    cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd ..

    PACKAGE_FILE="$(pwd)/packages_dnf.txt"
    PACKAGES=($(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE"))

    sudo dnf install -y "${PACKAGES[@]}"

    echo "[+] Packages installed."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_packages_dnf
fi
