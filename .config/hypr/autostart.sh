# alias
alias gr='busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay'

export GTK_THEME=Nordic-darker
wlr-randr --output HDMI-A-1 --mode 1920x1080@74.973000Hz

# set wallpaper
swww init &
# /home/felix/.local/bin/wall

# set brightness and temp
wl-gammarelay-rs &

# notification daemon
mako &

# auth agent
/usr/lib/polkit-kde-authentication-agent-1 &

# start kdeconnect
/usr/lib/kdeconnectd & 

# set dmps shit
# /home/felix/.local/bin/suspend.sh &

sleep 5
gr Brightness d 0.3
gr Temperature q 4500

# fix cursor
# hyprctl setcursor 'Nordzy-cursors' 24 &
waybar &

nm-applet &
