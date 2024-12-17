#!/bin/bash

# Locate the i3 IPC socket dynamically
SOCKET=$(find /run/user/1000/ -name "ipc-socket*" 2>/dev/null | head -n 1)

if [[ -z "$SOCKET" ]]; then
    exit 1
fi

# Detect primary and secondary monitors
PRIMARY=$(xrandr --query | grep " primary" | awk '{print $1}')
SECONDARY=$(xrandr --query | grep " connected" | grep -v " primary" | awk '{print $1}')

# Assign workspaces to monitors
i3-msg --socket="$SOCKET" "workspace 1; move workspace to output $PRIMARY"

if [[ -n "$SECONDARY" ]]; then
    i3-msg --socket="$SOCKET" "workspace 2; move workspace to output $SECONDARY"
fi

