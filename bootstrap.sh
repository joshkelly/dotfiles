#!/usr/bin/env bash

cd ~/dotfiles

rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude ".DS_Store" \
      --exclude ".osx" \
      --exclude "bootstrap.sh" \
      --exclude "setup.sh" \
      --exclude "README.md" \
      --exclude "*.otf" \
      -avh --no-perms . ~;
