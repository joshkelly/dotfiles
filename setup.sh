#!/usr/bin/env bash

cd .vim/bundle/

git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/sirver/ultisnips
git clone https://github.com/sickill/vim-monokai
git clone https://github.com/pangloss/vim-javascript
git clone https://github.com/mxw/vim-jsx
git clone https://github.com/lokaltop/vim-powerline

cd ~/dotfiles

wget https://github.com/supermarin/powerline-fonts/raw/master/Monaco/Monaco%20for%20Powerline.otf
mv Monaco%20for%20Powerline.otf ~/Library/Fonts/

rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude ".DS_Store" \
      --exclude ".osx" \
      --exclude ".otf" \
      --exclude "bootstrap.sh" \
      --exclude "setup.sh" \
      --exclude "README.md" \
      -avh --no-perms . ~;
