#!/bin/bash
# Path to your sidepanel config
CONFIG="$HOME/.config/waybar/sidepanel.conf"
STYLE="$HOME/.config/waybar/sidepanel.css"

while true; do
    # Get mouse X position
    MOUSE_X=$(hyprctl cursorpos | cut -d',' -f1)
    
    # If mouse is at the far left (0 to 10 pixels)
    if [ "$MOUSE_X" -le 10 ]; then
        if ! pgrep -f "waybar -c $CONFIG"; then
            waybar -c "$CONFIG" -s "$STYLE" &
        fi
    # If mouse leaves the panel area (greater than 310 pixels)
    elif [ "$MOUSE_X" -gt 310 ]; then
        pkill -f "waybar -c $CONFIG"
    fi
    sleep 0.2
done