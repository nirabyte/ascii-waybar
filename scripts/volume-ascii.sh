#!/bin/bash
# ASCII Volume Display

# Get volume level and mute status
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(?<=Mute: ).*')

# Check if muted
if [ "$mute" = "yes" ]; then
    echo "MUTE"
    exit 0
fi

# Create ASCII volume bar (longer)
if [ "$volume" -ge 90 ]; then
    echo "VOL ██████████ ${volume}%"
elif [ "$volume" -ge 80 ]; then
    echo "VOL █████████░ ${volume}%"
elif [ "$volume" -ge 70 ]; then
    echo "VOL ████████░░ ${volume}%"
elif [ "$volume" -ge 60 ]; then
    echo "VOL ███████░░░ ${volume}%"
elif [ "$volume" -ge 50 ]; then
    echo "VOL ██████░░░░ ${volume}%"
elif [ "$volume" -ge 40 ]; then
    echo "VOL █████░░░░░ ${volume}%"
elif [ "$volume" -ge 30 ]; then
    echo "VOL ████░░░░░░ ${volume}%"
elif [ "$volume" -ge 20 ]; then
    echo "VOL ███░░░░░░░ ${volume}%"
elif [ "$volume" -ge 10 ]; then
    echo "VOL ██░░░░░░░░ ${volume}%"
else
    echo "VOL █░░░░░░░░░ ${volume}%"
fi
