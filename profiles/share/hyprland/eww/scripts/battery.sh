#!/usr/bin/env bash

BATTERY='/sys/class/power_supply/BAT0'

if [[ ! -d $BATTERY ]]; then
  sleep 10
  notify-send "$SCRIPT" "No battery detected at $BATTERY"
  exit 1
fi

icons=(' ' ' ' ' ' ' ' ' ')
icons_idx=0
prev_status=$(cat "$BATTERY/status")

print_status() {
  echo "${icons[$icons_idx]} $capacity%"
}

while true; do
  curr_status=$(cat "$BATTERY/status")
  capacity=$(cat "$BATTERY/capacity")

  if [[ "$curr_status" != "$prev_status" ]]; then
    notify-send "Battery" "$curr_status..."
    prev_status="$curr_status"
  fi

  if [[ "$curr_status" == 'Charging' ]]; then
    if [[ $icons_idx -ge 4 ]]; then
      icons_idx=1
    else
      ((icons_idx++))
    fi
  else
    if [[ $capacity -lt 20 ]]; then
      icons_idx=0
    elif [[ $capacity -lt 40 ]]; then
      icons_idx=1
    elif [[ $capacity -lt 60 ]]; then
      icons_idx=2
    elif [[ $capacity -lt 80 ]]; then
      icons_idx=3
    else
      icons_idx=4
    fi
  fi

  print_status
  sleep 1
done
