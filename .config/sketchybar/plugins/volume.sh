#!/usr/bin/env bash
get=$(osascript -e 'get volume settings')%
LABEL=$(osascript -e 'output volume of (get volume settings)')

case $LABEL in
   100) ICON="􀊩 " ;;
    9[0-9]) ICON="􀊩 " ;;
    8[0-9]) ICON="􀊩 " ;;
    7[0-9]) ICON="􀊩 " ;;
    6[0-9]) ICON="􀊧 " ;;
    5[0-9]) ICON="􀊧 " ;;
    4[0-9]) ICON="􀊧 " ;;
    3[0-9]) ICON="􀊧 " ;;
    2[0-9]) ICON="􀊥 " ;;
    1[0-9]) ICON="􀊥 " ;;
    *) ICON="􀊥 "
esac

if [[ $get == *"false"* ]]; then
	sketchybar -m --set $NAME icon=$ICON
fi

if [[ $get == *"true"* ]]; then
	sketchybar -m --set $NAME icon="􀊣 "
fi

sketchybar -m --set $NAME label="$LABEL%"
