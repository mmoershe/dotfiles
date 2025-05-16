#!/bin/bash

update_fedora() {
    echo
    echo "[ ] Updating Fedora..."

    sudo dnf update -y

    echo "[+] System updated."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    update_fedora
fi
