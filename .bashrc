# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# history length
export HISTSIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# (On Debian) See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Setup a nicer prompt

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

# command line bookmarks
#source $HOME/.cdargs-bash.sh

# command completion for human beings
#export COMPLEAT_USER_DIR=$XDG_CONFIG_HOME/compleat
#source "$HOME/.local/share/compleat-1.0/compleat_setup"

# synchronize hist between sessions
#shopt -s histappend
#PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"

# adjust color scheme according to outdoor/indoor setting
#[ -f "$HOME/.outdoor.on" ] && xtermcontrol

# enable zsh-like recursive globbing
shopt -s globstar

# enable autojump
. /usr/share/autojump/autojump.sh

export GIT_PS1_SHOWDIRTYSTATE="yes"

# workaround for git calling vim with YouCompleteMe on Mac
export EDITOR="DYLD_FORCE_FLAT_NAMESPACE=1 vim"
