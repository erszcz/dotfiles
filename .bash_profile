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

# Init asdf - the universal env manager
if [ -f $HOME/.asdf.on ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
    . $HOME/.kerlrc
    export KERL_BUILD_DOCS
    export KERL_INSTALL_MANPAGES
    export KERL_CONFIGURE_OPTIONS
    #ASDF_ERLANG_MAN="$(dirname $(dirname $(asdf which erl)))/man"
    ASDF_ERLANG_MAN="/Users/erszcz/.asdf/installs/erlang/23.0-rc2/man"
    [ -d "$ASDF_ERLANG_MAN" ] && {
      export MANPATH="$ASDF_ERLANG_MAN:$MANPATH"
    }

    # We don't have to run it on every shell startup.
    # Check $HOME/.local/share/kubectl/kubectl.bash_completion
    #kubectl completion bash > /tmp/kubectl.bash_completion
    source $HOME/.local/share/kubectl/kubectl.bash_completion
fi

# Erlang 20.0+ shell history
export ERL_AFLAGS="-kernel shell_history enabled"

[ -f "$HOME/.bash_completion.d/complete_alias" ] \
  && source "$HOME/.bash_completion.d/complete_alias"

# Homebrew prefix
HOMEBREW_PREFIX="$(brew --prefix)"

# Homebrew bash-completion
[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] \
  && . "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"

# Homebrew installed asdf
[[ -r "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh" ]] \
  && . "${HOMEBREW_PREFIX}/opt/asdf/libexec/asdf.sh"

# Erlang settings for asdf/kerlrc
if [ -f "${HOME}/.kerlrc" ]; then
  . "${HOME}/.kerlrc"
fi

# kubectl bash completion
if [ -f "${HOME}/.kube/completion" ]; then
  . "${HOME}/.kube/completion"
fi
