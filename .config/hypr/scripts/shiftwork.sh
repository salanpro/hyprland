#!/bin/bash

current=$(hyprctl -j activeworkspace | jq '.id')

existing_workspaces=$(hyprctl -j workspaces | jq -r '.[].id' | sort -n)

max_ws=$(echo "$existing_workspaces" | tail -1)

if [ "$max_ws" -le "$current" ]; then
    next=$((current + 1))
    hyprctl dispatch workspace "$next"
    exit 0
fi

for ws in $(echo "$existing_workspaces" | sort -rn); do
    if [ "$ws" -gt "$current" ]; then
        target=$((ws + 1))
        
        windows=$(hyprctl -j clients | jq -r ".[] | select(.workspace.id == $ws) | .address")
        
        if [ -n "$windows" ]; then
            while IFS= read -r win; do
                [ -n "$win" ] && hyprctl dispatch movetoworkspacesilent "$target,address:$win"
            done <<< "$windows"
        fi
    fi
done

next=$((current + 1))
hyprctl dispatch workspace "$next"
