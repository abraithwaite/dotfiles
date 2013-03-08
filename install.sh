#!/bin/bash


DIR="$( dirname "${BASH_SOURCE[0]}" )"
DIR="$( cd "$DIR" && pwd )"
FILES="pdbrc zshrc bashrc gitconfig hgrc"
echo $DIR
for file in $FILES
do
    if [ -a ~/.$file ]
    then
        mv ~/.$file{,.bak}
    fi
    ln -s $DIR/$file ~/.$file
done

