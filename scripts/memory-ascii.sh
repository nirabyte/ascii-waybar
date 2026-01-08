#!/bin/bash
# ASCII Memory/RAM Display

# Get memory usage
mem_info=$(free -m | awk 'NR==2{printf "%.0f %.0f", $3, $2}')
used=$(echo $mem_info | awk '{print $1}')
total=$(echo $mem_info | awk '{print $2}')

# Calculate percentage
percentage=$((used * 100 / total))

# Create ASCII memory bar (longer)
if [ "$percentage" -ge 90 ]; then
    echo "MEM ██████████ ${percentage}%"
elif [ "$percentage" -ge 80 ]; then
    echo "MEM █████████░ ${percentage}%"
elif [ "$percentage" -ge 70 ]; then
    echo "MEM ████████░░ ${percentage}%"
elif [ "$percentage" -ge 60 ]; then
    echo "MEM ███████░░░ ${percentage}%"
elif [ "$percentage" -ge 50 ]; then
    echo "MEM ██████░░░░ ${percentage}%"
elif [ "$percentage" -ge 40 ]; then
    echo "MEM █████░░░░░ ${percentage}%"
elif [ "$percentage" -ge 30 ]; then
    echo "MEM ████░░░░░░ ${percentage}%"
elif [ "$percentage" -ge 20 ]; then
    echo "MEM ███░░░░░░░ ${percentage}%"
elif [ "$percentage" -ge 10 ]; then
    echo "MEM ██░░░░░░░░ ${percentage}%"
else
    echo "MEM █░░░░░░░░░ ${percentage}%"
fi
