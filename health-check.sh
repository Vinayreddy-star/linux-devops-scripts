#!/bin/bash
echo "=== Day 1 System Health Check ==="
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk '{print $(NF-2), $(NF-1), $NF}')"
echo "Memory Usage: $(free -h | grep Mem | awk '{print $3 "/" $2 " (" $3/$2*100 "% used)"}')"
echo "Disk Usage (/): $(df -h / | awk 'NR==2{print $5}')"
echo "Total Processes: $(ps aux | wc -l)"
echo "Logged Users: $(who | wc -l)"
