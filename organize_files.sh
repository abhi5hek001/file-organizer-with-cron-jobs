#!/bin/bash
# Core logic to organize files

organize_files() {
    local SOURCE="$1"
    local DEST="$2"
    local LOG="$3"

    for file in "$SOURCE"/*; do
        [ -f "$file" ] || continue
        filename=$(basename "$file")

        # Detect type
        mimetype=$(file --mime-type -b "$file")
        case "$mimetype" in
            image/*) folder="Images" ;;
            video/*) folder="Videos" ;;
            application/pdf|application/msword|application/vnd*) folder="Documents" ;;
            *) folder="Others" ;;
        esac

        mkdir -p "$DEST/$folder"
        mv "$file" "$DEST/$folder/"
        log_action "Moved $filename to $folder" "$LOG"
    done
}
