#! /bin/bash
VIMFILES=$HOME/.vim
# mkdir $VIMFILES/tmp
# mkdir $VIMFILES/bak

git clone https://github.com/gmarik/vundle.git $VIMFILES/bundle/vundle

ln -nfs $HOME/.vim/editorconfig $HOME/.editorconfig

npm install -g eslint                     \
               standard                   \
               babel-eslint               \
               eslint-plugin-promise      \
               eslint-plugin-standard     \
               eslint-config-standard     \
               eslint-config-standard-jsx \
               eslint-plugin-react        \
               eslint-plugin-vue          \
               eslint-plugin-prettier     \
               prettier

ln -nfs $HOME/.vim/eslintrc $HOME/.eslintrc
ln -nfs $HOME/.vim/prettierrc.json $HOME/.prettierrc.json

# And install these coc extensions
# coc-ultisnips 1.2.3 ~/.config/coc/extensions/node_modules/coc-ultisnips
# coc-sh 0.4.0 ~/.config/coc/extensions/node_modules/coc-sh
# coc-json 1.2.5 ~/.config/coc/extensions/node_modules/coc-json
# coc-eslint 1.2.6 ~/.config/coc/extensions/node_modules/coc-eslint
# coc-vetur 1.1.10 ~/.config/coc/extensions/node_modules/coc-vetur
# coc-tsserver 1.4.15 ~/.config/coc/extensions/node_modules/coc-tsserver
# coc-solargraph 1.1.6 ~/.config/coc/extensions/node_modules/coc-solargraph
# coc-python 1.2.12 ~/.config/coc/extensions/node_modules/coc-python
# coc-html 1.2.4 ~/.config/coc/extensions/node_modules/coc-html
# coc-docker 0.2.1 ~/.config/coc/extensions/node_modules/coc-docker
# coc-css 1.2.3 ~/.config/coc/extensions/node_modules/coc-css
# coc-ccls 0.0.5 ~/.config/coc/extensions/node_modules/coc-ccls

# Notes
# 1. For coc-ccls, please update the clang resource-dir in coc-settings.json
