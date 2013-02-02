#!/bin/bash

# stolen from https://github.com/mathiasbynens/dotfiles

cd "$(dirname "${BASH_SOURCE}")"
git pull
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
