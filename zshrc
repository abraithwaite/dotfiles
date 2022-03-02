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
alias vim='nvim -O'
alias dc='docker-compose --no-ansi'

# Virtualenv stuff
venvwrap=/usr/local/bin/virtualenvwrapper.sh && test -f $venvwrap && source $venvwrap

if [[ -s "$SSH_AUTH_SOCK" ]]; then
	ln -s "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

function git-read-branch() {
  git ls-tree -r $1 | grep $2 | awk '{print $3}' | xargs git cat-file blob
}

source ~/.dotfiles/dates.zsh

export HOMEBREW_NO_INSTALL_CLEANUP=1

if (( $+commands[kubectl] ))
then
	source <(kubectl completion zsh)
fi


alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export NVM_DIR="$HOME/.nvm"
if [[ -f /usr/share/nvm/init-nvm.sh ]]
then
	source /usr/share/nvm/init-nvm.sh
fi
# source /usr/local/opt/nvm/nvm.sh

export GOPATH=~/Projects/golang
path=($path $GOPATH/bin)

export GO111MODULE=on
export GOPRIVATE=github.com/segment*

function gomodclean() {
  chmod -R +w $GOPATH/pkg/mod/$1
  rm -r $GOPATH/pkg/mod/$1
}

unsetopt LIST_BEEP
unsetopt CORRECT

if [[ -f ~/.workenv ]]
then
	source ~/.workenv
fi

if (( $+commands[bat] ))
then
	alias cat='bat --style=plain,snip'
fi
