#!/bin/bash
# ASCII Art display script for waybar

# Simple rotating ASCII patterns
patterns=(
    "█▓▒░"
    "▓▒░█"
    "▒░█▓"
    "░█▓▒"
)

# Get current second for pattern rotation
second=$(date +%S)
index=$((second % 4))

echo "${patterns[$index]}"


