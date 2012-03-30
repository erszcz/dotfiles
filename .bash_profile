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
  && PATH="/opt/local/bin":"${PATH}"

[ -d "/opt/local/sbin" ] \
  && PATH="/opt/local/sbin":"${PATH}"

[ -d "/usr/local/bin" ] \
  && PATH="/usr/local/bin":"${PATH}"

[ -d "/usr/local/sbin" ] \
  && PATH="/usr/local/sbin":"${PATH}"

#[ -d "/usr/local/erlang/r14b01/lib/erlang/bin" ] \
  #&& PATH="/usr/local/erlang/r14b01/lib/erlang/bin":"${PATH}"
#[ -d "/usr/local/erlang/r14b03/lib/erlang/bin" ] \
  #&& PATH="/usr/local/erlang/r14b03/lib/erlang/bin":"${PATH}"

#[ -d "/usr/local/erlang/r14b01/bin" ] \
  #&& PATH="/usr/local/erlang/r14b01/bin":"${PATH}"
#[ -d "/usr/local/erlang/r14b03/bin" ] \
  #&& PATH="/usr/local/erlang/r14b03/bin":"${PATH}"


export MANPATH="$HOME/.local/man:$HOME/.local/share/man:$HOME/.local/local/man:`manpath`"

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# enable bash completion from ports
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export XDG_CONFIG_HOME="$HOME/.config"
