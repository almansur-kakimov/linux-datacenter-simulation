#!/bin/bash

# Configuration
LOG_FILE="server_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Function to write to log
log_message() {
    echo "[$DATE] $1" | tee -a $LOG_FILE
}

log_message "Starting Health Check"

# 1. Check Nginx
if systemctl is-active --quiet nginx; then
    log_message "[PASS] Web Service (Nginx) is Active"
else
    log_message "[CRITICAL] Web Service (Nginx) is DOWN"
fi

# 2. Check Disk Space
USAGE=$(df / --output=pcent | tail -1 | tr -dc '0-9')

if [ $USAGE -gt 80 ]; then
    log_message "[WARNING] Disk Space High: $USAGE%"
else
    log_message "[PASS] Disk Space Normal: $USAGE%"
fi

log_message "Check Complete"
echo "" >> $LOG_FILE
