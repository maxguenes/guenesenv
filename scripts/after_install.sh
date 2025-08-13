#!/bin/bash
set -e

echo "Executing after install"

# Forces nvm and pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

git config --global user.name "Max Guenes"
git config --global user.email "maxguenes@gmail.com"
git config --global core.editor "vim"

nvm install 22

pyenv install 3.12
pyenv global 3.12
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper

pip install --user spotify-cli-linux awscli awscli-local
