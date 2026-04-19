#!/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/nhatbui/.Xauthority

# Small delay so xrandr sees the updated state after hotplug
sleep 1

DP0=$(xrandr | grep "^DisplayPort-0 connected")
DP1=$(xrandr | grep "^DisplayPort-1 connected")

if [ -n "$DP1" ] && [ -n "$DP0" ]; then
    xrandr \
      --output eDP --off \
      --output DisplayPort-1 --primary --mode 3440x1440 --pos 0x0 --rotate normal \
      --output DisplayPort-0 --mode 2560x1440 --pos 3440x0 --rotate right
elif [ -n "$DP1" ]; then
    xrandr \
      --output eDP --off \
      --output DisplayPort-1 --primary --mode 3440x1440 --pos 0x0 --rotate normal \
      --output DisplayPort-0 --off
elif [ -n "$DP0" ]; then
    xrandr \
      --output eDP --off \
      --output DisplayPort-0 --primary --mode 2560x1440 --pos 0x0 --rotate right \
      --output DisplayPort-1 --off
else
    # No external monitors — fall back to laptop screen
    xrandr \
      --output eDP --auto \
      --output DisplayPort-0 --off \
      --output DisplayPort-1 --off
fi

# disabled temporarily
# Wait for i3 to register the new output layout
# sleep 2
#
# # Move all workspaces to the primary output so nothing is stranded
# i3-msg -t get_workspaces | python3 -c "
# import json, sys, subprocess
# workspaces = json.load(sys.stdin)
# for ws in workspaces:
#     subprocess.run(
#         ['i3-msg', '[workspace=\"{}\"] move workspace to output primary'.format(ws['name'])],
#         capture_output=True
#     )
# "
#
# # Focus the primary output
# i3-msg focus output primary
