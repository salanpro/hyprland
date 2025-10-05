#!/usr/bin/env bash

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle \
&& (wpctl get-volume @DEFAULT_AUDIO_SINK@ \
| grep -q MUTED && \
notify-send -e -u low -h \
string:x-canonical-private-synchronous:volume_notif \
"🔇 Muted" || wpctl get-volume @DEFAULT_AUDIO_SINK@ | \
awk '{print int($2*100)}' | xargs -I[] \
notify-send -e -u low -h string:x-canonical-private-synchronous:volume_notif -h \
int:value:[] "🔊 Volume: []%")