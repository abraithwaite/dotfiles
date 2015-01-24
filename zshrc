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
bindkey "^R" backward-delete-char

zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.pyc' 

# Virtualenv stuff
venvwrap=/usr/local/bin/virtualenvwrapper.sh && test -f $venvwrap && source $venvwrap
