#!/bin/bash
set -e # Exit on error

### SETUP ###
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONT_DIR="$SCRIPT_DIR/fonts"
FONT_DEST="$HOME/.local/share/fonts"

PACKAGE_FILE="$SCRIPT_DIR/packages.txt"
PACKAGES=($(grep -vE '^\s*#|^\s*$' "$PACKAGE_FILE"))

FLATPAK_FILE="$SCRIPT_DIR/flatpaks.txt"
FLATPAKS=($(grep -vE '^\s*#|^\s*$' "$FLATPAK_FILE"))

DOTFILES=(
    bash
)

### FUNCTIONS ###

update_system() {
    echo "[*] Updating Fedora..."
    sudo dnf update -y
    echo "[+] System updated."
}

install_packages() {
    echo "[*] Installing packages..."
    sudo dnf install -y "${PACKAGES[@]}"
    echo "[+] Packages installed."
}

install_flatpaks() {
    echo "[*] Installing Flatpaks..."
    if ! command -v flatpak &>/dev/null; then
        echo "[!] Flatpak is not installed. Installing it via dnf..."
        sudo dnf install -y flatpak
    fi

    # Ensure Flathub is added
    if ! flatpak remote-list | grep -q flathub; then
        echo "[*] Adding Flathub remote..."
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    fi

    for pkg in "${FLATPAKS[@]}"; do
        flatpak install -y --noninteractive flathub "$pkg"
    done

    echo "[+] Flatpak apps installed."
}

install_specials() {
    echo "[*] Installing some special packages..."
    # Lazygit
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install lazygit -y

    # Starship
    curl -sS https://starship.rs/install.sh | sudo sh

    # My Neovim-Config
    if [ -d "$HOME/.config/nvim" ]; then
        echo "Neovim-Config already exists."
    else
        git clone https://github.com/mmoershe/config.nvim "$HOME/.config/nvim"
    fi

    echo "[+] Special packages installed."
}

install_fonts() {
    echo "[*] Installing fonts from $FONT_DIR..."
    mkdir -p "$FONT_DEST"
    find "$FONT_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp {} "$FONT_DEST" \;
    fc-cache -fv "$FONT_DEST"
    echo "[+] Fonts installed to $FONT_DEST."
}

stow_dotfiles() {
    echo "[*] Stowing dotfiles..."
    cd "$SCRIPT_DIR"
    for pkg in "${DOTFILES[@]}"; do
        stow "$pkg"
    done
    echo "[+] Dotfiles symlinked."
}

### MAIN ###
update_system
install_packages
install_flatpaks
install_specials
install_fonts
stow_dotfiles

echo "[✓] All done!"
