#!/bin/bash
# Core file organizing logic

organize_files() {
    local SOURCE="$1"
    local DEST="$2"
    local LOG="$3"

    # Create destination directories
    mkdir -p "$DEST"/{Images,Videos,Documents,Others}

    # Move files based on their extensions
    find "$SOURCE" -type f -exec bash -c '
        file="$1"
        dest="$2"
        log="$3"
        
        case "${file,,}" in
            *.jpg|*.jpeg|*.png|*.gif) category="Images" ;;
            *.mp4|*.avi|*.mov|*.wmv) category="Videos" ;;
            *.pdf|*.doc|*.docx|*.txt) category="Documents" ;;
            *) category="Others" ;;
        esac
        
        mv "$file" "$dest/$category/"
        
        if [ "$log" = true ]; then
            source ./logger_and_cron.sh
            log_action "Moved $(basename "$file") to $category" true
        fi
    ' _ {} "$DEST" "$LOG" \;
}
