if [ -f ~/.ohmyzsh.sh ]; then
  . ~/.ohmyzsh.sh
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.custom.sh ]; then
  . ~/.custom.sh
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export AWSLOCAL_DEFAULT_REGION=us-east-2
