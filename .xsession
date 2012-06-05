#!/bin/sh

xrandr | grep "CRT1 connected" > /dev/null
if [ $? = 0 ]; then
    xrandr --output CRT1 --mode 1440x900 &
fi

wmname LG3D
export XDG_CONFIG_HOME="$HOME/.config"

xkbset b r rate 200 40
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wicd-client -t &

exec awesome
