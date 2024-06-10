#!/bin/bash

config="$HOME/.config/wofi/config"
style="$HOME/.config/wofi/style.css"
entries=" Lock\n󰗽 Logout\n⏾ Suspend\n Reboot\n⏻ Shutdown"

if [[ -z $(pgrep wofi) ]]; then
  selected=$(echo -e $entries|wofi --width 250 --height 210 --conf "$config" --style "$style" --dmenu --cache-file /dev/null | awk '{print tolower($2)}')
else
  killall wofi
fi

case $selected in
  lock)
    exec hyprlock;;
  logout)
    hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
