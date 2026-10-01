#!/bin/bash

rank_mirrors() {
    echo "[ ] Ranking mirrors..."

    # Arch mirrors: the 10 fastest of the 20 most recently synced German https mirrors
    if sudo reflector --country Germany --protocol https --age 12 --latest 20 --sort rate --number 10 --save /etc/pacman.d/mirrorlist; then
        # A freshly ranked list supersedes the one shipped by pacman-mirrorlist
        sudo rm -f /etc/pacman.d/mirrorlist.pacnew
    else
        echo "Warning: reflector failed, keeping the current Arch mirrorlist"
    fi

    # EndeavourOS mirrors (the old list is kept as endeavouros-mirrorlist.bak)
    if eos-rankmirrors; then
        sudo rm -f /etc/pacman.d/endeavouros-mirrorlist.pacnew
    else
        echo "Warning: eos-rankmirrors failed, keeping the current EndeavourOS mirrorlist"
    fi

    echo "[✓] Ranking mirrors..."
}

remove_orphans() {
    echo "[ ] Removing orphaned packages..."

    local orphans=()
    mapfile -t orphans < <(pacman -Qdtq)

    if [[ ${#orphans[@]} -eq 0 ]]; then
        echo "No orphaned packages found"
    else
        # No --noconfirm on purpose: pacman lists what would be removed and asks
        sudo pacman -Rns "${orphans[@]}"
    fi

    echo "[✓] Removing orphaned packages..."
}

clean_package_caches() {
    echo "[ ] Cleaning package caches..."

    # Keep the two most recent versions of each package for downgrades
    sudo paccache -rk2
    # Drop every cached version of packages that are no longer installed
    sudo paccache -ruk0
    # AUR build directories: uninstalled packages, downloaded sources and built packages
    yay -Sc --aur --noconfirm

    echo "[✓] Cleaning package caches..."
}

report_leftovers() {
    echo
    echo "Unmerged config files (merge them with: sudo pacdiff):"
    pacdiff --output

    echo
    echo "Failed systemd units:"
    systemctl --failed --no-legend --no-pager
}

maintenance() {
    SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    rank_mirrors

    source "$SCRIPTS_DIR/update.sh"
    update

    remove_orphans
    clean_package_caches
    report_leftovers
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    maintenance
fi
