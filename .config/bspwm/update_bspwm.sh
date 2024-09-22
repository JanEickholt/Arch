#!/bin/bash

# Get the ID of the currently focused monitor
current_monitor=$(bspc query -M -m focused)

# Get the ID of the currently focused desktop
current_desktop=$(bspc query -D -d focused)

# Get the ID of the currently focused window
current_window=$(bspc query -N -n focused)

# Restart bspwm
bspc wm -r

# Add a small delay to allow bspwm to fully reload
sleep 0.1

# Refocus the monitor, desktop, and window after the restart
bspc monitor $current_monitor -f
bspc desktop $current_desktop -f

# Check if the window still exists (it might not if it was closed)
if bspc query -N -n "$current_window" > /dev/null 2>&1; then
    bspc node "$current_window" -f
fi

