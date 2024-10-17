#! /bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed 's/0.0//' | sed 's/0.//')
mode=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [[ ! -z  $mode ]]; then
    echo "  Muted"
else
    echo "  $volume%"
fi
