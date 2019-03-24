#!/bin/bash

# Config files
cp terminal/.profile terminal/.bash_profile ~/
mkdir ~/.config
mkdir ~/.config/powerline
cp terminal/powerline/config.json ~/.config/powerline/
cp git/.gitconfig ~/
cp vim/.vimrc ~/
cp eslint/.eslintrc ~/

# Node and JS utilities
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
brew install python3

source ~/.profile
nvm install --lts
npm install -g eslint

# Terminal powerline
pip3 install powerline-status
pip3 show powerline-status

source ~/.profile
mkdir ~/.config/powerline
cp -r /usr/local/lib/python3.7/site-packages/powerline/config_files/ ~/.config/powerline/
powerline-daemon --replace
