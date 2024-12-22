#!/bin/bash

fanspeed=$(cat /proc/acpi/ibm/fan | awk 'NR==3 {print $2}')
echo $fanspeed

if [[ $fanspeed == "auto" ]]; then
	pkexec bash -c 'echo level 0 > /proc/acpi/ibm/fan'
else
	pkexec bash -c 'echo level auto > /proc/acpi/ibm/fan'
fi
