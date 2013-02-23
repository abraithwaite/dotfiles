#!/bin/bash


DIR="$( dirname "${BASH_SOURCE[0]}" )"
FILES="pdbrc zshrc bashrc gitconfig gdbrc"
echo $DIR
for file in $FILES
do
    if [ -a ~/.$file ]
    then
        mv ~/.$file{,.bak}
    fi
    ln -s $(pwd)/$file ~/.$file
done

