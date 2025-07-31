#!/bin/bash
set -e

echo "#### Installing Python ####"

apt_get_packages=(
  python3-dev
  python3-debugpy
  libssl-dev
  lzma
  liblzma-dev
  libbz2-dev
  libsqlite3-dev
  python3-tk
  libffi-dev
)

apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
sudo apt-get install --yes $apt_join_packages

if ! which pyenv >/dev/null; then

  echo "Setting up pyenv on ~/.profile"
  curl -fsSL https://pyenv.run | bash
fi

if ! which poetry >/dev/null; then
  curl -sSL https://install.python-poetry.org | python3 -
fi
