#! /bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top 2> /dev/null & disown

if [[ $(xrandr --query | grep "HDMI-1 connected") ]]; then
    polybar top_external 2> /dev/null & disown
fi
