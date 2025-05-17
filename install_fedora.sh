#!/bin/bash

### SETUP ###
set -e # Exit on error

DOTFILES_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIRECTORY="${DOTFILES_DIRECTORY}/scripts"

### SOURCING ###
source "${SCRIPTS_DIRECTORY}/update_fedora.sh"
source "${SCRIPTS_DIRECTORY}/install_packages_dnf.sh"
source "${SCRIPTS_DIRECTORY}/install_flatpaks.sh"
source "${SCRIPTS_DIRECTORY}/install_specials_dnf.sh"
source "${SCRIPTS_DIRECTORY}/install_fonts.sh"
source "${SCRIPTS_DIRECTORY}/stow_all.sh"

### MAIN ###
update_fedora
install_packages_dnf
install_flatpaks
install_specials_dnf
install_fonts
stow_all

tmux source ~/.tmux.conf

### EXIT ###
echo "[✓] All done!"
exit
