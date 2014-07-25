#!/bin/bash
git clone --recursive https://github.com/abraithwaite/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles && $HOME/.dotfiles/install.sh
