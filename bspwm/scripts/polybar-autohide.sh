#!/bin/bash
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    if [ "$state" = "fullscreen" ]; then
        if [ "$flag" = "on" ]; then
            polybar-msg cmd hide > /dev/null 2>&1
        else
            polybar-msg cmd show > /dev/null 2>&1
        fi
    fi
done
