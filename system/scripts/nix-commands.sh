#!/usr/bin/env bash

set -euo pipefail

# Define the available commands
declare -A commands=(
    ["sudo nixos-rebuild switch --flake . --impure"]="sudo nixos-rebuild switch --flake . --impure"
    ["home-manager switch --flake ."]="home-manager switch --flake ."
    ["nix flake update"]="nix flake update"
)

# Get user's choice using gum
choice=$(gum choose \
    --header="What would you like to do?" \
    "sudo nixos-rebuild switch --flake . --impure" \
    "home-manager switch --flake ." \
    "nix flake update")

# Check if user cancelled (empty selection)
if [[ -z "$choice" ]]; then
    echo "No selection made. Exiting."
    exit 0
fi

# Change to dotfiles directory and execute the selected command
echo "Executing: ${commands[$choice]}"
cd "$HOME/dotfiles" && eval "${commands[$choice]}"

echo "Done!"
