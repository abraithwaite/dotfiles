#!/bin/bash
if [ ! $(which git) ];
then
    echo "Please enter your password to install git"
    sudo apt-get install git zsh
fi
git clone --recursive https://github.com/Caustic/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles && $HOME/.dotfiles/install.sh
