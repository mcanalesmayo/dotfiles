#!/bin/bash

cp git/.gitconfig ~/
cp vim/.vimrc ~/
cp eslint/.eslintrc ~/

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

source ~/.profile

nvm install --lts
npm install -g eslint
