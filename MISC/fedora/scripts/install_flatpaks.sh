#!/bin/bash
set -e # Exit on error

install_flatpaks() {
    echo
    echo "[ ] Installing Flatpaks..."

    SCRIPTS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    DOTFILES_DIRECTORY="$(dirname "${SCRIPTS_DIRECTORY}")"

    FLATPAK_FILE="${DOTFILES_DIRECTORY}/flatpaks.txt"
    FLATPAKS=($(grep -vE '^\s*#|^\s*$' "$FLATPAK_FILE"))

    if ! command -v flatpak &>/dev/null; then
        echo "    [!] Flatpak is not installed. Installing it via dnf..."
        sudo dnf install -y flatpak
        echo "    [✓] Flatpak installed."
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
