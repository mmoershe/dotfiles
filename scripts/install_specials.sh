#!/bin/bash

special_install() {
    SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    SPECIAL_INSTALL_DIR="$SCRIPTS_DIR/special_installs"

    options=(
        "install docker"
        "install nvim config"
        "load gnome settings"
    )

    choice=$(gum choose --header="Choose a special install" "${options[@]}")

    [[ -z "$choice" ]] && {
        echo "No selection made. Exiting."
        exit 0
    }

    if [[ $choice == "install docker" ]]; then
        echo "Installing Docker..."
        source "$SPECIAL_INSTALL_DIR/install_docker.sh"
        install_docker
    fi

    if [[ $choice == "install nvim config" ]]; then
        echo "Installing Neovim config..."
        source "$SPECIAL_INSTALL_DIR/install_nvim_config.sh"
        install_nvim_config
    fi

    if [[ $choice == "load gnome settings" ]]; then
        echo "Loading Gnome settings..."
        source "$SPECIAL_INSTALL_DIR/load_gnome_settings.sh"
        load_gnome_settings
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    special_install
fi
