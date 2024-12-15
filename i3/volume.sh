#!/bin/bash

# Get the volume
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

if [ "$MUTE" = "yes" ]; then
    echo "🔇 $VOLUME"
else
    echo "🔈 $VOLUME"
fi
