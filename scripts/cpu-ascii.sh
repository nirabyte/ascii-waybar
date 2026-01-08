#!/bin/bash
# ASCII CPU Usage Display

# Get CPU usage percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Convert to integer
cpu_int=$(printf "%.0f" "$cpu_usage")

# Create ASCII bar based on CPU usage (longer)
if [ "$cpu_int" -ge 90 ]; then
    echo "CPU ██████████ ${cpu_int}%"
elif [ "$cpu_int" -ge 80 ]; then
    echo "CPU █████████░ ${cpu_int}%"
elif [ "$cpu_int" -ge 70 ]; then
    echo "CPU ████████░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 60 ]; then
    echo "CPU ███████░░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 50 ]; then
    echo "CPU ██████░░░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 40 ]; then
    echo "CPU █████░░░░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 30 ]; then
    echo "CPU ████░░░░░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 20 ]; then
    echo "CPU ███░░░░░░░ ${cpu_int}%"
elif [ "$cpu_int" -ge 10 ]; then
    echo "CPU ██░░░░░░░░ ${cpu_int}%"
else
    echo "CPU █░░░░░░░░░ ${cpu_int}%"
fi
