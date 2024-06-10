#! /bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
mode=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [[ ! -z  $mode ]]; then
    echo "  Muted"
else
    echo "  $volume"
fi
