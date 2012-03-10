# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

alias c="clear"
alias la="ls -a"
alias lal="ls -la"
alias vi="vim -p"
alias vim="vim -p"
alias p1="cd school/fall2011/csci311/p1"
alias updatemirrors="sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias backupmirrors="sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup"

#HOW DID THIS GET HERE I NOT GOOD WITH COMPUTER!! ~caustic regarding below:
#
#rvm stuff for railstutorials
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
