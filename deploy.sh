#!/bin/bash

echo ""
echo "1) Omarchy"
echo "2) Fedora-Sway"
echo ""
read -p "Enter system to deploy >> " choice

if [[ "$choice" == "1" ]]; then
    echo "Deploying Omarchy..."
    $HOME/dotfiles/platforms/omarchy/deploy_omarchy.sh
elif [[ "$choice" == "2" ]]; then
    echo "Deploying Fedora-Sway..."
    # ...
else
    echo "Invalid choice. Exiting."
    exit 1
fi
