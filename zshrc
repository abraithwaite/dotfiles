# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

setopt autonamedirs
unsetopt cdable_vars
unsetopt correctall

# emacs mode
bindkey -e

# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-pattern-search-backward

zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.pyc' 

alias tmux='tmux -2'
alias vim='vim -O'

# Virtualenv stuff
venvwrap=/usr/local/bin/virtualenvwrapper.sh && test -f $venvwrap && source $venvwrap

if [[ -s "$SSH_AUTH_SOCK" ]]; then
	ln -s "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

function git-read-branch() {
  git ls-tree -r $1 | grep $2 | awk '{print $3}' | xargs git cat-file blob
}
export GOPATH=~/Projects/golang
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GO15VENDOREXPERIMENT=1

source ~/.dotfiles/dates.zsh
