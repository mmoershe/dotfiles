#!/usr/bin/env bash

set -euo pipefail

commands=(
    "codium-install-extensions"
    "codium-save-extensions"
)

choice=$(gum choose --header="What would you like to do?" "${commands[@]}")

[[ -z "$choice" ]] && {
    echo "No selection made. Exiting."
    exit 0
}

echo "Executing: $choice"
eval "$choice"
echo "Done!"
