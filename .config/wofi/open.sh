#! /bin/bash

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

if [[ ! $(pgrep wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    killall wofi
fi
