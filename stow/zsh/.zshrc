# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.config/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.config/prezto/init.zsh"
fi

# Auto-start ssh-agent for SSH sessions only
if [[ -n "$SSH_CLIENT" || -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
  if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh/agent.env
  fi
  if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source ~/.ssh/agent.env > /dev/null
  fi
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

# Virtualenv stuff - check common locations
for venvwrap in /usr/local/bin/virtualenvwrapper.sh /usr/bin/virtualenvwrapper.sh; do
  [[ -f $venvwrap ]] && source $venvwrap && break
done

if [[ -s "$SSH_AUTH_SOCK" ]]; then
	ln -s "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

function git-read-branch() {
  git ls-tree -r $1 | grep $2 | awk '{print $3}' | xargs git cat-file blob
}

function clone-image() {
	local imgname=$(echo $1 | cut -d':' -f1 | xargs basename)
	local imgver=$(echo $1 | cut -d':' -f2-)
	echo "cloning $imgname:$imgver"
	docker pull $1
	docker tag $1 registry.gitlab.com/abraithwaite/i/$imgname:$imgver
	docker push registry.gitlab.com/abraithwaite/i/$imgname:$imgver
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
export SOPS_AGE_KEY_FILE=$HOME/.config/sops/key.txt

# fnm
FNM_PATH="/home/abraithwaite/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/abraithwaite/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
