#!/bin/bash
# Main CLI Script

source ./organize_files.sh
source ./logger_and_cron.sh

LOG=false
SOURCE=""
DEST=""

# Parse CLI arguments
while getopts "s:d:l" opt; do
  case $opt in
    s) SOURCE="$OPTARG" ;;
    d) DEST="$OPTARG" ;;
    l) LOG=true ;;
    *) echo "Usage: $0 -s <source> [-d <dest>] [-l]"; exit 1 ;;
  esac
done

# Validate inputs
[ -z "$SOURCE" ] && { echo "Error: Source directory required!"; exit 1; }
[ -d "$SOURCE" ] || { echo "Error: Source is not a directory!"; exit 1; }
[ -z "$DEST" ] && DEST="$SOURCE"

# Call the core function
organize_files "$SOURCE" "$DEST" "$LOG"
