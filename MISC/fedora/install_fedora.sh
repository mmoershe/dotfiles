#!/bin/bash

### SETUP ###
set -e # Exit on error

FEDORA_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIRECTORY="${FEDORA_DIRECTORY}/scripts"
MISC_DIRECTORY="$(cd "$(dirname "${FEDORA_DIRECTORY}")" && pwd)"
GENERIC_DIRECTORY="${MISC_DIRECTORY}/generic"

### SOURCING ###
source "${SCRIPTS_DIRECTORY}/update_fedora.sh"
source "${SCRIPTS_DIRECTORY}/install_packages_dnf.sh"
source "${GENERIC_DIRECTORY}/install_flatpaks.sh"
source "${SCRIPTS_DIRECTORY}/install_specials_dnf.sh"
source "${GENERIC_DIRECTORY}/install_fonts.sh"
source "${GENERIC_DIRECTORY}/download_wallpapers.sh"
source "${SCRIPTS_DIRECTORY}/stow_all.sh"

### MAIN ###
update_fedora
install_packages_dnf
install_flatpaks
install_specials_dnf
install_fonts
download_wallpapers
stow_all

source ~/.bashrc
tmux source ~/.tmux.conf

### EXIT ###
echo "[✓] All done!"
exit
