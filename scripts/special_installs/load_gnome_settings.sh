#!/bin/bash

load_gnome_settings() {
    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
    GNOME_SETTINGS_FILE="$DOTFILES_DIR/guides/gnome_settings/gnome-settings.ini"

    dconf load / < "$GNOME_SETTINGS_FILE"
    echo "Gnome settings loaded. Probably need to reboot as well."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    load_gnome_settings
fi
