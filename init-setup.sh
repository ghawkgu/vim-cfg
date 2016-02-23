#! /bin/bash
VIMFILES=$HOME/.vim
# mkdir $VIMFILES/tmp
# mkdir $VIMFILES/bak

git clone https://github.com/gmarik/vundle.git $VIMFILES/bundle/vundle

ln -nfs $HOME/.vim/editorconfig $HOME/.editorconfig
ln -nfs $HOME/.vim/eslintrc.json $HOME/.eslintrc.json
