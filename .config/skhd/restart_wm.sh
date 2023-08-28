#!/bin/bash
osascript <<< "display notification \"Restarting Environment\" with title \"Windows Manager\""
yabai --restart-service
skhd --restart-service
sketchybar --reload
