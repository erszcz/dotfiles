#!/bin/sh

cfg.resolution

wmname LG3D
export XDG_CONFIG_HOME="$HOME/.config"

cfg.keyboard

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
#wicd-client -t &
nm-applet &

exec awesome
