#!/usr/bin/env bash
source ${HOME}/.config/sketchybar/plugins/music_check.sh

length=$(echo ${LABEL} | awk '{print length;}')


if [[ $length -gt 70 ]]; then
  sketchybar -m --set $NAME drawing=off
else
  sketchybar -m --set $NAME drawing=on
fi

WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')

case $WINDOW_TITLE in

  kitty)
	 WINDOW_TITLE=Kitty;;
  *);;
esac

sketchybar -m --set $NAME icon="  $WINDOW_TITLE"
