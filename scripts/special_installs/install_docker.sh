#!/bin/bash

install_docker() {
    sudo pacman -S docker docker-compose
    systemctl enable --now docker.socket
    sudo usermod -aG docker $USER
    newgrp docker
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_docker
fi
