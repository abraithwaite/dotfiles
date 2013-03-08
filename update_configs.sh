#!/bin/bash

REPOS="/home/abraithwaite/.dotfiles /home/abraithwaite/.vim"
for repo in $REPOS;
do
    echo "Updating $repo"
    pushd $repo > /dev/null
    git pull
    popd > /dev/null
done
