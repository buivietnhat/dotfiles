#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/nhatbui/.Xauthority

# Configure monitor layout first
~/.config/i3/display_setup.sh

# Wait for i3 to register the new output layout
sleep 2

SOCKET=$(find /run/user/1000/ -name "ipc-socket*" 2>/dev/null | head -n 1)
if [[ -z "$SOCKET" ]]; then
    exit 1
fi

PRIMARY=$(xrandr --query | grep " primary" | awk '{print $1}')
mapfile -t SECONDARIES < <(xrandr --query | grep " connected" | grep -v " primary" | awk '{print $1}')

# Workspaces 1–4, 9–10 on primary
for ws in 1 2 3 4 9 10; do
    i3-msg --socket="$SOCKET" "workspace $ws; move workspace to output $PRIMARY"
done

# Workspaces 5–8 on first secondary (if present)
if [[ ${#SECONDARIES[@]} -gt 0 ]]; then
    for ws in 5 6 7 8; do
        i3-msg --socket="$SOCKET" "workspace $ws; move workspace to output ${SECONDARIES[0]}"
    done
fi

# Return focus to primary
i3-msg --socket="$SOCKET" "workspace 1"
