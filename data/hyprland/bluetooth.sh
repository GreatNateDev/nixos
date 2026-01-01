#!/usr/bin/env bash

choice=$(bluetoothctl devices |
  sed 's/^Device //' |
  fuzzel --dmenu --prompt="Bluetooth > ")

[ -z "$choice" ] && exit 0

mac=$(echo "$choice" | awk '{print $1}')

if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
  bluetoothctl disconnect "$mac"
else
  bluetoothctl connect "$mac"
fi
