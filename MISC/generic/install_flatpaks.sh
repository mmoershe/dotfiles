#!/bin/bash
set -e # Exit on error

install_flatpaks() {
    echo
    echo "[ ] Installing Flatpaks..."

    CURRENT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    FLATPAK_FILE="${CURRENT_DIRECTORY}/flatpaks.txt"
    FLATPAKS=($(grep -vE '^\s*#|^\s*$' "$FLATPAK_FILE"))

    if ! command -v flatpak >/dev/null 2>&1; then
        echo "    [!] Error: Flatpak is not installed. Exiting."
        exit 1
    fi

    # Ensure Flathub is added
    if ! flatpak remote-list | grep -q flathub; then
        echo "    [ ] Adding Flathub remote..."
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        echo "    [✓] Added Flathub remote..."
    fi

    for pkg in "${FLATPAKS[@]}"; do
        flatpak install -y --noninteractive flathub "$pkg"
        echo "    [✓] Installed "$pkg""
    done

    echo "    [ ] Updating Flatpak..."
    sudo flatpak update -y
    echo "    [✓] Updated Flatpak."

    echo

    echo "[+] Flatpak apps installed."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_flatpaks
fi
