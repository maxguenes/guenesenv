#!/bin/bash
set -e

git config --global user.name "Max Guenes"
git config --global user.email "maxguenes@gmail.com"

nvm install 22

pyenv install 3.12
pyenv global 3.12

pip install --user spotify-cli-linux awscli awscli-local
