#!/usr/bin/env bash
get=$(osascript -e 'get volume settings')%
LABEL=$(osascript -e 'output volume of (get volume settings)')%

if [[ $get == *"false"* ]]; then
	sketchybar -m --set $NAME icon="󰕾 "
fi

if [[ $get == *"true"* ]]; then
	sketchybar -m --set $NAME icon="󰖁 "
fi

sketchybar -m --set $NAME label=$LABEL
