#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"

options=(
    "update"
    "install packages"
    "stow all"
    "special install"
)

choice=$(gum choose --header="What would you like to do?" "${options[@]}")

[[ -z "$choice" ]] && {
    echo "No selection made. Exiting."
    exit 0
}

if [[ $choice == "update" ]]; then
    echo "sudo pacman -Syu"
    sudo pacman -Syu

    echo "yay -Syu --noconfirm"
    yay -Syu --noconfirm
fi

if [[ $choice == "install packages" ]]; then
    source "$SCRIPTS_DIR/install_packages.sh"
    install_packages
fi

if [[ $choice == "stow all" ]]; then
    source "$SCRIPTS_DIR/stow_all.sh"
    stow_all
fi

if [[ $choice == "special install" ]]; then
    source "$SCRIPTS_DIR/install_specials.sh"
    special_install
fi
