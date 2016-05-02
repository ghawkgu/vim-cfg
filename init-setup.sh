#! /bin/bash
VIMFILES=$HOME/.vim
# mkdir $VIMFILES/tmp
# mkdir $VIMFILES/bak

git clone https://github.com/gmarik/vundle.git $VIMFILES/bundle/vundle

ln -nfs $HOME/.vim/editorconfig $HOME/.editorconfig

npm install -g eslint \
               standard \
               babel-eslint \
               eslint-plugin-promise \
               eslint-plugin-stardard \
               eslint-config-standard \
               eslint-config-standard-jsx \
               eslint-plugin-react

ln -nfs $HOME/.vim/eslintrc $HOME/.eslintrc
