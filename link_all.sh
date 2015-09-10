#!/bin/bash
# Link all configs

link_but_backup()
{
    local target=$1
    local dest=$2
    if [ ! -e ${dest}_old ]; then
        mv ${dest} ${dest}_old
        ln -fs ${target} ${dest}
    fi
}


link_but_backup ~/configs/emacs/.emacs ~/.emacs
link_but_backup ~/configs/tmux/.tmux.conf ~/.tmux.conf
link_but_backup ~/configs/git/.gitconfig ~/.gitconfig
