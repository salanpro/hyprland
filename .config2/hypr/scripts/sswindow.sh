#!/usr/bin/env bash

pkill slurp || hyprshot -m window -z --raw \
| satty --filename - \
--output-filename ~/Pictures/Screenshots/Screenshot__$(date +'%d-%m-%Y__%H-%M-%S').png \
--copy-command 'wl-copy' \
--disable-notifications
