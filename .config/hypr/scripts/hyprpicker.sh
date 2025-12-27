#!/bin/bash
sleep 0.2

color=$(hyprpicker -a)

if [ -n "$color" ]; then
    notify-send "Color copied" "$color" -t 800
fi
