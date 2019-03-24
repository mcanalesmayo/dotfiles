#!/bin/bash

cp git/.gitconfig ~/
cp vim/.vimrc ~/
cp eslint/.eslintrc ~/

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

brew install python3

source ~/.profile

nvm install --lts
npm install -g eslint

pip3 install powerline-status
pip3 show powerline-status

source ~/.profile

mkdir ~/.config/powerline
cp -r /usr/local/lib/python3.7/site-packages/powerline/config_files/ ~/.config/powerline/
