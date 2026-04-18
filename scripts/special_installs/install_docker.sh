#!/bin/bash

sudo pacman -S docker docker-compose

systemctl enable --now docker.socket

sudo usermod -aG docker $USER

newgrp docker
