# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt cdable_vars
unsetopt correctall
workrc=$HOME/work/dev/work_utils.sh && test -f $workrc && source $workrc
fedorarc=$HOME/.fedorarc.sh && test -f $fedorarc && source $fedorarc
#This was a bad idea.
#echo "Updating .vim and .dotfiles"
#update=$HOME/.dotfiles/update_configs.sh && test -f $update && $update > /tmp/update.log 2>&1 & disown

# ENV
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
export EDITOR=vim

alias c="clear"
alias vim="vim -O"
alias py="/usr/bin/python"
alias fdate="date +'%y-%m-%d'"
alias gdb="gdb -q"
alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias ecenet="cd ~/work/school/networks"
alias tmux="tmux -2"

bindkey -v
# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char

#rvm stuff for rails
#export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

setopt autonamedirs
