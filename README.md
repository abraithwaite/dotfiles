dotfiles
========

Dependencies:
nvim bat git curl

This is my collection of dotfiles and configurations.  Feel free to use them.

See also my [dotvim](https://github.com/abraithwaite/dotvim) repository.

Finally, I use Zsh with [prezto](https://github.com/sorin-ionescu/prezto) as
my configuration framework. (The theme for prezto I use is steef).

To update:

    cd prezto && git pull origin alan-fork
    git add prezto && git commit -m 'update prezto'

    # on the next pull
    git submodule update --init --recursive
