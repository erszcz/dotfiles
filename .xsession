#!/bin/sh

xkbset b r rate 200 40
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
wicd-client -t &

exec awesome
