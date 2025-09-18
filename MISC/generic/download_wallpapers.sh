#!/bin/bash
set -e # Exit on error

download_wallpapers() {
    echo "[ ] Downloading wallpapers..."

    CURRENT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    WALLPAPERS_FILE="${CURRENT_DIRECTORY}/wallpapers.txt"
    DESTINATION_DIRECTORY="$HOME/Pictures/wallpapers"

    LINKS=($(grep -vE '^\s*#|^\s*$' "$WALLPAPERS_FILE"))

    mkdir -p "$DESTINATION_DIRECTORY"

    count=1

    for URL in "${LINKS[@]}"; do
        if [[ $count -eq 1 ]]; then
            FILENAME="wallpaper.jpg"
        else
            FILENAME="wallpaper${count}.jpg"
        fi

        DESTINATION_FILE="$DESTINATION_DIRECTORY/$FILENAME"

        echo
        echo "    [ ] Downloading: $URL --> $FILENAME"
        sudo wget -q -O "$DESTINATION_FILE" "$URL"
        echo "    [+] Done"

        ((count++))
    done

    echo
    echo "[+] Wallpapers downloaded."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    download_wallpapers
fi
