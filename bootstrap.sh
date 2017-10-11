#!/usr/bin/env bash

cd ~/dotfiles

rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude ".DS_Store" \
      --exclude ".osx" \
      --exclude "bootstrap.sh" \
      --exclude "setup.sh" \
      --exclude "*.otf" \
      --exclude "README.md" \
      -avh --no-perms . ~;
