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

if [ -d ~/.local/bin ] ; then
    PATH=~/.local/bin:"${PATH}"
fi

[ -d "/opt/local/bin" ] \
  && export PATH="/opt/local/bin":"${PATH}"

[ -d "/opt/local/sbin" ] \
  && export PATH="/opt/local/sbin":"${PATH}"

[ -d "/usr/local/bin" ] \
  && export PATH="/usr/local/bin":"${PATH}"

[ -d "/usr/local/sbin" ] \
  && export PATH="/usr/local/sbin":"${PATH}"

# Enable Homebrew
if [ -d "/opt/homebrew/bin" ]; then
 # ... on Apple M Silicon
  export PATH="/opt/homebrew/bin:${PATH}"
fi
eval "$(brew shellenv)"

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
        AUTOJUMP_PATH="/usr/local/opt/autojump/etc/autojump.sh"
        ;;
esac
if [ -f "$AUTOJUMP_PATH" ]; then
    . "$AUTOJUMP_PATH"
fi

# extend svn with some git-like niceties
[ -f "${HOME}/.subversion/svn.sh" ] && {
    . "${HOME}/.subversion/svn.sh"
}

# use cabal-installed binaries
[ -d "${HOME}/.cabal/bin" ] && {
  export PATH="${HOME}/.cabal/bin:${PATH}"
}

# Erlang 20.0+ shell history
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f "$HOME/.bash_completion.d/complete_alias" ] \
  && source "$HOME/.bash_completion.d/complete_alias"

# Homebrew bash-completion
[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] \
  && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

# Activate mise instead of asdf
eval "$(mise activate bash)"

# Erlang settings for asdf/mise/kerl
if [ -f "${HOME}/.kerlrc" ]; then
  . "${HOME}/.kerlrc"
fi

# kubectl bash completion
if [ -f "${HOME}/.kube/completion" ]; then
  . "${HOME}/.kube/completion"
fi

export XDG_DATA_HOME="${HOME}/.local/share"
