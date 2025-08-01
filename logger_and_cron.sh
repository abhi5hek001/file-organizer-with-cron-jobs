#!/bin/bash
# Logging and cron setup

log_action() {
    local MESSAGE="$1"
    local ENABLE_LOG="$2"
    if [ "$ENABLE_LOG" = true ]; then
        mkdir -p logs
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> logs/$(date '+%Y-%m-%d').log
    fi
}

setup_cron() {
    SCRIPT_PATH=$(realpath organizer.sh)
    (crontab -l 2>/dev/null; echo "0 * * * * $SCRIPT_PATH -s ~/Downloads -l") | crontab -
    echo "Cron job scheduled to run hourly."
}
