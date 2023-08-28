#!/usr/bin/env bash

WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')

case $WINDOW_TITLE in

  kitty)
	 WINDOW_TITLE=Kitty;;
  *);;
esac

sketchybar -m --set $NAME icon="  $WINDOW_TITLE"
