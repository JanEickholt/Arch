#! /bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top &

if [[ $(xrandr --query | grep "HDMI-1 connected") ]]; then
    polybar top_external
fi
