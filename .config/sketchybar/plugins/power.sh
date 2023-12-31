#!/bin/bash

sketchybar -m --set $NAME icon.font="SF Pro:Regular:14"

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

sketchybar -m --set $NAME
if [[ $CHARGING != "" ]]; then
  sketchybar -m --set $NAME \
    icon.color=0xFFEBCB8B \
    icon="􀢋 " \
    label=$(printf "${BATT_PERCENT}%%")
  exit 0
fi

[[ ${BATT_PERCENT} -gt 10 ]] && COLOR=0xFFA3BE8C || COLOR=0xFFFF6666

case ${BATT_PERCENT} in
   100) ICON="􀛨 " ;;
    9[0-9]) ICON="􀛨 " ;;
    8[0-9]) ICON="􀛨 " ;;
    7[0-9]) ICON="􀺸 " ;;
    6[0-9]) ICON="􀺸 " ;;
    5[0-9]) ICON="􀺶 " ;;
    4[0-9]) ICON="􀺶 " ;;
    3[0-9]) ICON="􀺶 " ;;
    2[0-9]) ICON="􀛩 " ;;
    1[0-9]) ICON="􀛩 " ;;
    *) ICON="􀛪 "
esac

if [[ $CHARGING == "" ]]; then
 sketchybar -m --set $NAME \
    icon=$ICON \
    icon.font="SF Pro:Regular:14" \
    icon.color=$COLOR \
    label.drawing=on \
    label="$(printf "${BATT_PERCENT}%%")"
 exit 0
fi
