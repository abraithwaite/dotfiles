# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.dotfiles/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.dotfiles/prezto/init.zsh"
fi

setopt autonamedirs
unsetopt cdable_vars
unsetopt correctall

# Vim mode
bindkey -v
# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char

zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.pyc' 

source <(npm completion)

workrc=$HOME/dev/work_utils.sh && test -f $workrc && source $workrc

# Virtualenv stuff
venvwrap=/usr/local/bin/virtualenvwrapper.sh && test -f $venvwrap && source $venvwrap
export WORKON_HOME="$HOME/.venvs"
