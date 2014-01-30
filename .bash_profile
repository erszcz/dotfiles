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

# enable bash completion
BASH_COMPLETION_PATH="/usr/local/Cellar/bash-completion/1.3/etc/bash_completion"
if [ -f "$BASH_COMPLETION_PATH" ]; then
    . "$BASH_COMPLETION_PATH"
else
    echo "bash completion not found: $BASH_COMPLETION_PATH"
fi

# activate kerl-installed erlang
. $HOME/apps/erlang/r16b01/activate

# activate groovy installation
export GROOVY_HOME="/Users/erszcz/apps/groovy-2.1.6"
export PATH="$GROOVY_HOME/bin:$PATH"
export JAVA_HOME="/Library/Java/Home"

# activate gradle
export PATH="$HOME/apps/gradle-1.6/bin:$PATH"

# extend svn with some git-like niceties
[ -f "${HOME}/.subversion/svn.sh" ] && {
    . "${HOME}/.subversion/svn.sh"
}

# activate cabal installed binaries
[ -d "${HOME}/.cabal/bin" ] && {
    export PATH="${HOME}/.cabal/bin:${PATH}"
}

# enable rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
