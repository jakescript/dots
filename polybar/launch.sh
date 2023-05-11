#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload primary_monitor &
  done
else
  polybar --reload primary_monitor &
fi
polybar primary_monitor --config=$HOME/.config/polybar/config 
