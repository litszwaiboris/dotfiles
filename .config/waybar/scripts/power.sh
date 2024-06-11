#!/bin/bash

entries=" Lock\n󰗽 Logout\n⏾ Suspend\n Reboot\n⏻ Shutdown"

if [[ -z $(pgrep fuzzel) ]]; then
  selected=$(echo -e $entries|fuzzel --dmenu --icon-theme Papirus-Dark --font="MesloLGS Nerd Font:size=15" --line-height=25 | awk '{print tolower($2)}')
else
  killall fuzzel
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
