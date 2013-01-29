#!/bin/sh

# allow users from localhost access to this session
xhost +localhost

cfg.resolution

wmname LG3D
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

echo "export DISPLAY=$DISPLAY" > "$HOME/.cache/xenv" &
cfg.keyboard

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
#wicd-client -t &
nm-applet &

exec awesome
