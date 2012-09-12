#!/bin/bash

# pd - pass directory, a utility to quickly share current working dir between sessions
alias pds='echo -n `pwd` > ~/.pdstack'
alias pdc='cd "`tail -n 1 ~/.pdstack`"'
alias pdcat='echo `cat ~/.pdstack`'
# no more pd

alias lla='ls -alh'
alias l1='ls -1'

alias ts='date +%F_%T'
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
    alias ls='ls --color=auto'
    alias ll='ls -l -h --color=auto'
    alias la='ls -A -h --color=auto'
    alias l='ls -CF -h --color=auto'

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
esac
