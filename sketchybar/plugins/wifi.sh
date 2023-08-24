#!/usr/bin/env bash
get=$(networksetup -getairportpower en0)

if [[ $get == *"Off"* ]]; then
	networksetup -setairportpower en0 on
fi

if [[ $get == *"On"* ]]; then
	networksetup -setairportpower en0 off
fi
