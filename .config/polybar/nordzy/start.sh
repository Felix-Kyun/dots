#!/usr/bin/env bash

polybar-msg cmd quit
# killall -q polybar

echo "---" | tee -a /tmp/polybar_top.log /tmp/polybar_bottom.log
polybar -c ~/.config/polybar/nordzy/config.ini top 2>&1 | tee -a /tmp/polybar_top.log & disown
polybar -c ~/.config/polybar/nordzy/config.ini bottom 2>&1 | tee -a /tmp/polybar_bottom.log & disown
