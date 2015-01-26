# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

setopt autonamedirs
unsetopt cdable_vars
unsetopt correctall

# Vim mode
bindkey -v
# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-search-backward

zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.pyc' 

alias tmux='tmux -2'

# Virtualenv stuff
venvwrap=/usr/local/bin/virtualenvwrapper.sh && test -f $venvwrap && source $venvwrap

if [[ -s "$SSH_AUTH_SOCK" ]]; then
	ln -s "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
