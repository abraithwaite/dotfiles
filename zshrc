# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt cdable_vars
unsetopt correctall
workrc=$HOME/dev/work_utils.sh && test -f $workrc && source $workrc

# ENV
export PATH=$PATH:/usr/bin/core_perl:$HOME/bin
export EDITOR=vim

alias s="source"
alias c="clear"
alias vim="vim -O"
alias py="/usr/bin/python"
alias fdate="date +'%y-%m-%d'"
alias gdb="gdb -q"
alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias ecenet="cd ~/work/school/networks"
alias tmux="tmux -2"
alias se="source env.sh"
if [[ -s "/usr/share/vim/vim73/macros/less.sh" ]]
then
    alias less="/usr/share/vim/vim73/macros/less.sh"
fi

bindkey -v
# for standard backspace while in insertion mode
bindkey "^?" backward-delete-char

setopt autonamedirs

zstyle ':completion:*:*:vi(m|):*' ignored-patterns '*.pyc' 

function add_group(){
    sudo usermod -a -G $1 $2
}
