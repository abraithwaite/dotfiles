# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.prezto/init.zsh"
fi

setopt autonamedirs
unsetopt cdable_vars
unsetopt correctall
unsetopt LIST_BEEP
unsetopt CORRECT

# emacs mode
bindkey -e

# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char
bindkey "^R" history-incremental-pattern-search-backward

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

if (( $+commands[bat] ))
then
	alias cat='bat --style=plain,snip'
fi


alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export NVM_DIR="$HOME/.nvm"
if [[ -f /usr/share/nvm/init-nvm.sh ]]
then
	source /usr/share/nvm/init-nvm.sh
fi

export GOPATH=~/Projects/golang
path=(/usr/local/go/bin $path $GOPATH/bin)

function gomodclean() {
  chmod -R +w $GOPATH/pkg/mod/$1
  rm -r $GOPATH/pkg/mod/$1
}

if [[ -f ~/.workenv ]]
then
	source ~/.workenv
fi

export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
