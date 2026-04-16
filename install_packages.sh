#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$BASE_DIR/packages"
PACKAGES_AUR_DIR="$PACKAGES_DIR/aur"
PROFILE="${1:-$(whoami)}"
VALID_PROFILES=("lothric" "rellana" "thiollier")

install_pacman_packages_from_file() {
    local file_path="$1"

    # Check if file exists
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found: $file_path"
        return 1
    fi

    # Check if file is empty
    if [[ ! -s "$file_path" ]]; then
        echo "Error: File is empty: $file_path"
        return 1
    fi

    echo "Installing packages from: $file_path"

    # Filter out empty lines and comments, then bundle into single pacman call
    local packages=()
    while IFS= read -r package; do
        # Skip empty lines and comments
        [[ -z "$package" || "$package" =~ ^# ]] && continue
        packages+=("$package")
    done <"$file_path"

    if [[ ${#packages[@]} -eq 0 ]]; then
        echo "Warning: No packages found to install"
        return 1
    fi

    echo "Installing ${#packages[@]} packages..."
    sudo pacman -S --noconfirm "${packages[@]}"
}

install_aur_packages_from_file() {
    local file_path="$1"

    # Check if file exists
    if [[ ! -f "$file_path" ]]; then
        echo "Error: File not found: $file_path"
        return 1
    fi

    # Check if file is empty
    if [[ ! -s "$file_path" ]]; then
        echo "Error: File is empty: $file_path"
        return 1
    fi

    echo "Installing AUR packages from: $file_path"

    # Filter out empty lines and comments, then bundle into single yay call
    local packages=()
    while IFS= read -r package; do
        # Skip empty lines and comments
        [[ -z "$package" || "$package" =~ ^# ]] && continue
        packages+=("$package")
    done <"$file_path"

    if [[ ${#packages[@]} -eq 0 ]]; then
        echo "Warning: No packages found to install"
        return 1
    fi

    echo "Installing ${#packages[@]} AUR packages..."
    yay -S --noconfirm "${packages[@]}"
}

if [[ ! " ${VALID_PROFILES[@]} " =~ " ${PROFILE} " ]]; then
    echo "Error: Invalid profile '$PROFILE'"
    echo "Valid profiles: ${VALID_PROFILES[*]}"
    exit 1
fi

echo "Installing $PROFILE packages"

if [[ $PROFILE == "lothric" ]]; then
    install_pacman_packages_from_file $PACKAGES_DIR/core.txt
    install_pacman_packages_from_file $PACKAGES_DIR/code.txt
fi

if [[ $PROFILE == "rellana" ]]; then
    install_pacman_packages_from_file $PACKAGES_DIR/core.txt
    install_pacman_packages_from_file $PACKAGES_DIR/code.txt
    install_pacman_packages_from_file $PACKAGES_DIR/hyprland.txt
fi

if [[ $PROFILE == "thiollier" ]]; then
    install_pacman_packages_from_file $PACKAGES_DIR/core.txt
    install_pacman_packages_from_file $PACKAGES_DIR/code.txt
    install_aur_packages_from_file $PACKAGES_AUR_DIR/thiollier.txt
fi

echo
echo "bye $PROFILE!"
