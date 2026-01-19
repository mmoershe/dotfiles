#!/usr/bin/env bash

EXTENSIONS_DIR="$HOME/dotfiles/home/modules/codium/extensions.txt"

# Export the list of installed extensions
echo "Saving installed extensions to extensions.txt..."
codium --list-extensions >"$EXTENSIONS_DIR"

if [ $? -eq 0 ]; then
    echo "Extensions list saved to extensions.txt."
else
    echo "Error occurred while saving extensions."
fi
