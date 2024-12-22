#!/bin/bash

echo Saisez vitesse des ventilateurs: \(1-7\)&& read value

if [[ $value == "1" ]]; then
	printf "\nSélectionné: 1"
	pkexec bash -c 'echo level 1 > /proc/acpi/ibm/fan'
elif [[ $value == "2" ]]; then
	printf "\nSélectionné: 2"
	pkexec bash -c 'echo level 2 > /proc/acpi/ibm/fan'
elif [[ $value == "3" ]]; then
	printf "\nSélectionné: 3"
	pkexec bash -c 'echo level 3 > /proc/acpi/ibm/fan'
elif [[ $value == "4" ]]; then
	printf "\nSélectionné: 4"
	pkexec bash -c 'echo level 4 > /proc/acpi/ibm/fan'
elif [[ $value == "5" ]]; then
	printf "\nSélectionné: 5"
	pkexec bash -c 'echo level 5 > /proc/acpi/ibm/fan'
elif [[ $value == "6" ]]; then
	printf "\nSélectionné: 6"
	pkexec bash -c 'echo level 6 > /proc/acpi/ibm/fan'
elif [[ $value == "7" ]]; then
	printf "\nSélectionné: 7"
	pkexec bash -c 'echo level 7 > /proc/acpi/ibm/fan'
else
	printf "\nSélectionné: $value"
	printf "\nInvalide, revenir à auto" && sleep 1
	pkexec bash -c 'echo level auto > /proc/acpi/ibm/fan'
fi
