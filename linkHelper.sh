#!/bin/bash
#Make symlinks in the appropriate parts of the home directory

CUR_DIR=`pwd`
vim_link () {
    #Setup vim

    #Setup all of the necessary vim dirs that I have
    mkdir -p ~/.vim/dirs/tmp
    mkdir -p ~/.vim/dirs/backups
    mkdir -p ~/.vim/dirs/undos
    
    #Link the vimrc to ~/.vimrc
    ln -s $CUR_DIR/vimrc ~/.vimrc
}

tmux_link () {
    #Setup tmux 
    #Link the tmux.conf to ~/.tmux.conf
    ln -s $CUR_DIR/tmux.conf ~/.tmux.conf
}

i3_link () {
    #Setup i3 

    #Link i3Config to ~/.i3/config
    ln -s $CUR_DIR/i3Config ~/.config/i3/config
    #Link i3status.conf to ~/.i3status.conf
    ln -s $CUR_DIR/i3status.conf ~/.i3status.conf 
}

show_help () {
    #Echo usage
    echo "Usage: ./linkHelper.sh <option>"
    echo "Options: "
    echo "-v link vim"
    echo "-t link tmux"
    echo "-i link i3"
    echo "-h show help"

}


if [ -z "$*" ]; 
then 
    show_help
    exit 0
fi
# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts hvti opt; do
    case "$opt" in
    h)
        show_help
        exit 0
        ;;
    v)  vim_link
        ;;
    t)  tmux_link 
        ;;
    i)  i3_link 
        ;;
    esac
done
exit 0
