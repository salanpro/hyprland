#!/usr/bin/env bash
option=$(printf "Region\nWindow\nFullscreen" | vicinae dmenu -p "Select type of Screenshot to edit 🖌️:" --no-quick-look)

sleep 0.1

case $option in
    "Region") ~/.config/hypr/scripts/ssregion.sh ;;
    "Window") ~/.config/hypr/scripts/sswindow.sh ;;
    "Fullscreen") ~/.config/hypr/scripts/ssfullscreen.sh ;;
esac
