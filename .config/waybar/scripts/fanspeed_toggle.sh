#!/bin/bash

fanspeed=$(cat /proc/acpi/ibm/fan | awk 'NR==3 {print $2}')

if [[ $fanspeed == "auto" ]]; then
	kitty $HOME/.config/waybar/scripts/fanspeed_set.sh
else
	pkexec bash -c 'echo level auto > /proc/acpi/ibm/fan' 
fi
