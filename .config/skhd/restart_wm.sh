#!/bin/bash
osascript <<< "display notification \"Restarting Environment\" with title \"Windows Manager\""
yabai --restart-service
/usr/bin/env skhd -r
killall Übersicht
open /Applications/Übersicht.app
