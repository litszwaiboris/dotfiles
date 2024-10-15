#!/usr/bin/env bash
osascript -e 'display notification "Restarting Environment" with title "Windows Manager"'
killall Dock
killall Finder
aerospace reload-config
brew services restart sketchybar
brew services restart borders
