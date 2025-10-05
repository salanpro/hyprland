#!/usr/bin/env bash

brightnessctl set 10%+ -m \
| awk -F ',' '{print $4+0}' \
| xargs -I[] notify-send -e -u low -h \
string:x-canonical-private-synchronous:brightness_notif -h \
int:value:[] "☀ Brightness: []%"