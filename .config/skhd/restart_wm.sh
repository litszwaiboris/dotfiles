#!/usr/bin/env bash
osascript -e 'display notification "Restarting Environment" with title "Windows Manager"'
killall Dock
killall Finder
yabai --restart-service
skhd --restart-service
sketchybar --reload
