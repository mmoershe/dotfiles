#!/usr/bin/env bash

set -euo pipefail

commands=(
    "sudo nixos-rebuild switch --flake . --impure"
    "home-manager switch --flake ."
    "nix flake update"
)

choice=$(gum choose --header="What would you like to do?" "${commands[@]}")

[[ -z "$choice" ]] && { echo "No selection made. Exiting."; exit 0; }

echo "Executing: $choice"
cd "$HOME/dotfiles" && eval "$choice"
echo "Done!"
