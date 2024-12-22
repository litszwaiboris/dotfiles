#! /bin/bash

volume=$(pamixer --get-volume)
mode=$(pamixer --get-volume-human)

if [[ $mode -eq "muted" ]]; then
    echo " "
else
    echo "  $volume"%
fi
