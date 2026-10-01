#!/bin/bash

update() {
    sudo pacman -Syu --noconfirm
    yay -Syu --noconfirm
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    update
fi
