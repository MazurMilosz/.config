#!/bin/bash

BRIGHTNESS=`xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1`
# BRIGHTNESS=0.4

echo $BRIGHTNESS

# xrandr --verbose | grep -i " connected" | cut -f1 -d ' '

if [[ $BRIGHTNESS<1.4 ]] ; then
    if [[ $BRIGHTNESS>0.3 ]] ; then
        BRIGHTNESS=$(echo "$BRIGHTNESS 0.1" | awk '{printf "%f", $1 + $2}')
        echo $BRIGHTNESS
        xrandr --output HDMI-1 --brightness $BRIGHTNESS
        xrandr --output eDP-1 --brightness $BRIGHTNESS
    fi
fi
