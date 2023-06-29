#!/bin/bash 
swayidle -w \
      timeout 60 ' hyprctl dispatch dpms off' \
              resume ' hyprctl dispatch dpms on'  \
      timeout 90 ' swaylock ' \
      before-sleep 'swaylock'
