#!/usr/bin/env bash

pkill slurp || hyprshot -m window --raw \
| satty --filename - \
--output-filename ~/Pictures/Screenshots/Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png \
--early-exit \
--copy-command 'wl-copy'