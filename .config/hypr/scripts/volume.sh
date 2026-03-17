#!/usr/bin/env bash

case $1 in
    up)   wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ ;;
    down) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    *)    echo "Usage: $0 [up|down]"; exit 1 ;;
esac

wpctl get-volume @DEFAULT_AUDIO_SINK@ | \
awk '{print int($2*100)}' | xargs -I[] \
notify-send -e -u low -h string:x-canonical-private-synchronous:volume_notif -h \
int:value:[] "󰕾   Volume: []%"
