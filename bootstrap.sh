#!/usr/bin/env bash
rsync --exclude ".git/" \
      --exclude ".DS_Store" \
      --exclude ".osx" \
      --exclude "bootstrap.sh" \
      --exclude "README.md" \
      -avh --no-perms . ~;
