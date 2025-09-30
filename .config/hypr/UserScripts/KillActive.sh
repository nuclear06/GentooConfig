#!/bin/env sh
# Steam will exit entirely when its last window is closed using the killactive dispatcher.
# To minimize Steam to tray, use the following script to close applications:

if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
    xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive ""
fi
