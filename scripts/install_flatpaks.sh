#!/bin/bash

install_flatpaks() {
    echo
    echo "[ ] Installing Flatpaks..."

    cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    echo ${BASH_SOURCE[0]}
    cd ..

    FLATPAK_FILE="$(pwd)/flatpaks.txt"
    FLATPAKS=($(grep -vE '^\s*#|^\s*$' "$FLATPAK_FILE"))

    if ! command -v flatpak &>/dev/null; then
        echo "[!] Flatpak is not installed. Installing it via dnf..."
        sudo dnf install -y flatpak
    fi

    # Ensure Flathub is added
    if ! flatpak remote-list | grep -q flathub; then
        echo "[*] Adding Flathub remote..."
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    for pkg in "${FLATPAKS[@]}"; do
        flatpak install -y --noninteractive flathub "$pkg"
        echo "    [✓] Installed "$pkg""
    done

    echo "[+] Flatpak apps installed."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_flatpaks
fi
