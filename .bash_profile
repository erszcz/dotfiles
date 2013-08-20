if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

[ -d "/opt/local/bin" ] \
  && export PATH="/opt/local/bin":"${PATH}"

[ -d "/opt/local/sbin" ] \
  && export PATH="/opt/local/sbin":"${PATH}"

[ -d "/usr/local/bin" ] \
  && export PATH="/usr/local/bin":"${PATH}"

[ -d "/usr/local/sbin" ] \
  && export PATH="/usr/local/sbin":"${PATH}"

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# enable autojump
case `uname` in
    Linux)
        AUTOJUMP_PATH="/usr/share/autojump/autojump.sh"
        ;;
    Darwin)
        AUTOJUMP_PATH="/usr/local/Cellar/autojump/21.6.9/etc/autojump.bash"
        ;;
esac
if [ -f "$AUTOJUMP_PATH" ]; then
    . "$AUTOJUMP_PATH"
fi

# enable bash completion from ports
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
