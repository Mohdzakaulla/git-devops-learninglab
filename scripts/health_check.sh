#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
# Memory Usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

# Disk Usage of /
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "=============================="
echo "     SYSTEM MONITOR"
echo "=============================="

echo "CPU Usage    : $CPU_USAGE%"
echo "Memory Usage : $MEMORY_USAGE%"
echo "Disk Usage   : $DISK_USAGE%"
echo "------------------------------"

# CPU check
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
    echo "WARNING: CPU usage is HIGH"
else
    echo "CPU: OK"
fi

# Memory check
if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "WARNING: Memory usage is HIGH"
else
    echo "Memory: OK"
fi

# Disk check
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage is HIGH"
else
    echo "Disk: OK"
fi

echo "=============================="
