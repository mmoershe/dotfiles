#!/usr/bin/env bash

set -e

EXTENSIONS_DIR="$HOME/dotfiles/home/modules/codium/extensions.txt"

# Check if extensions.txt exists
if [ ! -f "$EXTENSIONS_DIR" ]; then
    echo "Error: Couldn't find extensions.txt."
    exit 1
fi

# Install extensions listed in extensions.txt
echo "Installing extensions from extensions.txt..."
xargs -n1 codium --install-extension <"$EXTENSIONS_DIR"

if [ $? -eq 0 ]; then
    echo "All extensions installed successfully."
else
    echo "Error occurred while installing extensions."
fi
