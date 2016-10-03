#!/bin/sh

# gpg-agent / ssh-agent setup
gpg-agent --daemon --enable-ssh-support \
    --write-env-file "${HOME}/.gpg-agent-info"

# allow users from localhost access to this session
xhost +localhost &

#cfg.resolution
cfg.colorscheme

# configure preferred file associations
xdg-mime default okular.desktop application/pdf &

wmname LG3D
export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"

echo "export DISPLAY=$DISPLAY" > "$HOME/.cache/xenv" &
cfg.keyboard

cfg.synaptics

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
#wicd-client -t &
nm-applet --no-check &

dropbox start &

conky &

# sync primary and secondary clipboard buffers
xcmenu &

#exec awesome
exec i3
