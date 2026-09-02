#!/bin/bash

THRESHOLD=80

USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

echo "Current disk usage: $USAGE%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage critical: $USAGE%"
else
    echo "Disk usage normal: $USAGE%"
fi