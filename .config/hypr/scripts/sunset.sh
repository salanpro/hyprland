#!/bin/bash

if pgrep -x "hyprsunset" > /dev/null; then
    pkill hyprsunset
    notify-send "Hyprsunset" "Desactivado"
else
    hyprsunset --temperature 5000 &
    notify-send "Hyprsunset" "Activado (3000K)"
fi
