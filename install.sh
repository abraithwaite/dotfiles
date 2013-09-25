#!/bin/bash

# Get to our working directory
DIR="$( dirname "${BASH_SOURCE[0]}" )"
DIR="$( cd "$DIR" && pwd )"

FILES="ackrc bashrc gitconfig hgrc pdbrc vim 
tmux.conf zshrc vimrc zpreztorc zshenv zprezto"
for file in $FILES
do
    if [ -e ~/.$file ]
    then
        mv ~/.$file{,.bak}
    fi
    ln -s $DIR/$file ~/.$file
done

