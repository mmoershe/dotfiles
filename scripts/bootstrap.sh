#!/bin/bash

bootstrap() {
    SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    source "$SCRIPTS_DIR/update.sh"
    update

    source "$SCRIPTS_DIR/install_packages.sh"
    install_packages

    source "$SCRIPTS_DIR/stow_all.sh"
    stow_all
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    bootstrap
fi
