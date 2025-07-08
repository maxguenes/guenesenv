#!/bin/bash
echo "#### Installing PyEnv ####"

if ! which pyenv > /dev/null; then
    echo "Setting up pyenv on ~/.profile"
    curl -fsSL https://pyenv.run | bash
fi

