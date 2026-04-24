#!/bin/bash

SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SPECIAL_INSTALL_DIR="$SCRIPTS_DIR/special_installs"

options=("install docker")

choice=$(gum choose --header="Choose a special install" "${options[@]}")

[[ -z "$choice" ]] && {
    echo "No selection made. Exiting."
    exit 0
}

echo
echo "You chose '$choice'..."
echo

if [[ $choice == "install docker" ]]; then
    echo "Installing Docker..."
    source "$SPECIAL_INSTALL_DIR/install_docker.sh"
    install_docker
fi
