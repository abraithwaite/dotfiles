#!/bin/bash

# Get to our working directory
DIR="$( dirname "${BASH_SOURCE[0]}" )"
DIR="$( cd "$DIR" && pwd )"

FILES="ackrc bashrc gitconfig hgrc pdbrc tmux.conf zshrc"
echo $DIR
for file in $FILES
do
    if [ -f ~/.$file ]
    then
        mv ~/.$file{,.bak}
    fi
    ln -s $DIR/$file ~/.$file
done

