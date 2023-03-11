#!/usr/bin/env bash

if [[ ! -e /sys/class/power_supply/BAT0 ]]; then
    echo "$0: Error: No battery detected"
    exit 1
fi

is_charging=1
capacity=100
sleep 5

while true; do
    case $(cat /sys/class/power_supply/BAT0/status) in
        'Charging')
            is_charging_now=1
            ;;
        'Discharging')
            is_charging_now=0
            ;;
        *)
            echo "$0: Error: Unrecognised status from /sys/class/power_supply/BAT0"
            exit 1
            ;;
    esac

    capacity_now=$(cat /sys/class/power_supply/BAT0/capacity)

    if (($is_charging != $is_charging_now)); then
        if [[ $is_charging_now == 1 ]]; then
            notify-send -u low 'Battery 󰂄 ' Charging...
        else
            notify-send -u normal 'Battery 󰂃 ' Discharging...
        fi
        is_charging=$is_charging_now
    fi

    if (($capacity != $capacity_now)); then
        if (($capacity_now == 100)); then
            notify-send -u low 'Battery 󰁹 ' Fully charged...
        elif (($capacity_now > 80)); then
            notify-send -u low 'Battery 󰂀 ' Sufficiently charged...
        elif (($capacity_now < 10)); then
            notify-send -u critical 'Battery 󰁼 ' Critically low...
        elif (($capacity_now < 20)); then
            notify-send -u normal 'Battery 󰁻 ' Cautiously low...
        fi
        capacity=$capacity_now
    fi

    sleep 1
done
