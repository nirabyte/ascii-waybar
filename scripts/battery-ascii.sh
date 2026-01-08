#!/bin/bash
# ASCII Battery Display

# Get battery information
battery_status=$(cat /sys/class/power_supply/BAT*/status 2>/dev/null || echo "Unknown")
battery_capacity=$(cat /sys/class/power_supply/BAT*/capacity 2>/dev/null || echo "0")

# Check if battery exists
if [ "$battery_capacity" = "0" ] && [ "$battery_status" = "Unknown" ]; then
    echo "AC"
    exit 0
fi

# Create ASCII battery bar based on capacity
if [ "$battery_capacity" -ge 90 ]; then
    bar="██████████"
elif [ "$battery_capacity" -ge 80 ]; then
    bar="█████████░"
elif [ "$battery_capacity" -ge 70 ]; then
    bar="████████░░"
elif [ "$battery_capacity" -ge 60 ]; then
    bar="███████░░░"
elif [ "$battery_capacity" -ge 50 ]; then
    bar="██████░░░░"
elif [ "$battery_capacity" -ge 40 ]; then
    bar="█████░░░░░"
elif [ "$battery_capacity" -ge 30 ]; then
    bar="████░░░░░░"
elif [ "$battery_capacity" -ge 20 ]; then
    bar="███░░░░░░░"
elif [ "$battery_capacity" -ge 10 ]; then
    bar="██░░░░░░░░"
else
    bar="█░░░░░░░░░"
fi

# Add charging indicator
if [ "$battery_status" = "Charging" ]; then
    echo "BAT ${bar} ${battery_capacity}% "
elif [ "$battery_status" = "Full" ]; then
    echo "BAT ${bar} ${battery_capacity}% "
else
    echo "BAT ${bar} ${battery_capacity}%"
fi
