#!/bin/bash

cat /proc/acpi/ibm/fan | awk 'NR==3 {print $2}'
