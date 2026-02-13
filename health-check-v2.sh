#!/bin/bash

LOG_FILE="/var/log/health-check.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] === Day 4 Docker Health Check ==="
UPTIME=$(uptime -p)
LOAD=$(uptime | awk '{print $(NF-2), $(NF-1), $NF}')
MEMORY=$(free -h | awk '/Mem/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $5}')
PROCS=$(ps aux | wc -l)
USERS=$(who | wc -l)

echo "Uptime: $UPTIME"
echo "Load Average: $LOAD"
echo "Memory Usage: $MEMORY"
echo "Disk Usage (/): $DISK"
echo "Total Processes: $PROCS"
echo "Logged Users: $USERS"

# Simple alert example
echo
if [[ "$DISK" > "80%" ]]; then
  echo "ALERT: Disk usage is above 80%!"
else
  echo "Disk usage is healthy."
fi

# Append to log file
echo "[$TIMESTAMP] Uptime=$UPTIME | Load=$LOAD | Mem=$MEMORY | Disk=$DISK | Procs=$PROCS | Users=$USERS" | sudo tee -a "$LOG_FILE" > /dev/null
