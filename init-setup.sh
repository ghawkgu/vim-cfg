#! /bin/bash
VIMFILES=$HOME/.vim
mkdir $VIMFILES/tmp
mkdir $VIMFILES/bak

git clone https://github.com/gmarik/vundle.git $VIMFILES/bundle/vundle

