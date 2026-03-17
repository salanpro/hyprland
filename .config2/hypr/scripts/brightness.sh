#!/usr/bin/env bash

case $1 in
    up)   brightnessctl set 10%+ -m ;;
    down) brightnessctl set 10%- -m ;;
    *)    echo "Usage: $0 [up|down]"; exit 1 ;;
esac | \
awk -F ',' '{print $4+0}' | \
xargs -I[] notify-send -e -u low -h \
string:x-canonical-private-synchronous:brightness_notif -h \
int:value:[] "󰃟   Brightness: []%"
