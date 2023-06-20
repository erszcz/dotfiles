#!/bin/bash

. ~/.complete_alias

# pd - pass directory, a utility to quickly share current working dir between sessions
alias pds='echo -n `pwd` > ~/.pdstack'
alias pdc='cd "`tail -n 1 ~/.pdstack`"'
alias pdcat='echo `cat ~/.pdstack`'
# no more pd

alias ts='date +%F_%H%M%S'
alias ds='date +%F'

alias grip='grep -i'
alias locate='locate -i'

# get/put for quick copying
alias get='cart get'
alias put='cart put'

# clear screen
alias cl=clear

case `uname` in
Linux)
    LS_COLOR="ls --color=auto"

    # Debian package management with bash autocompletion
    alias ac="apt-cache"
    alias ag="sudo apt-get"

    # Needed on Debian Testing with bash-completion version 1:2.0-1
    # for _apt_get and _apt_cache completion functions to be found.
    # On the contrary this doesn't seem to be necessary on Ubuntu Oneiric.
    [ -f "/usr/share/bash-completion/completions/apt-cache" ] && \
        . "/usr/share/bash-completion/completions/apt-cache"
    [ -f "/usr/share/bash-completion/completions/apt-get" ] && \
        . "/usr/share/bash-completion/completions/apt-get"

    complete -o filenames -F _apt_get ag
    complete -o filenames -F _apt_cache ac

    # alias for ack (known as ack-grep under Debian)
    alias ack="ack-grep"
    ;;
Darwin|DragonFly)
    LS_COLOR="ls -G"

    # workaround for brew/ports vim and YouCompleteMe
    alias vim="DYLD_FORCE_FLAT_NAMESPACE=1 vim"
    ;;
esac

alias ls="$LS_COLOR -CF -h"
alias l=ls
alias la="$LS_COLOR -A"
alias ll="$LS_COLOR -l"
alias lla="$LS_COLOR -al"
alias l1="$LS_COLOR -1"

# ack color settings depending on color scheme
if [ -f "$HOME/.outdoor.on" ]; then
    alias ack="ack --color-filename=red --color-lineno=blue"
fi

alias r3=rebar3

# renameutils qmv: move many files at once
alias mvm='qmv -f destination-only'

alias k=kubectl
complete -F _complete_alias k
