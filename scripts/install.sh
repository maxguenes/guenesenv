#!/bin/bash
set -e

BASEDIR=$(dirname "$0")
DISTRO="$(lsb_release -d | awk -F"\t" '{print $2}')"

echo "Using distro: $DISTRO"

if [[ $DISTRO =~ "Ubuntu" ]]; then
   echo "Installing Ubuntu packages"
   apt-get install --yes \
      neovim \
      btop \
      tmux \
      git \
      curl \
      python3-dev \
      python3-debugpy \
      openjdk-21-jdk \
      postgresql-client \
      nodejs \
      zsh \
      fzf \
      guake \
      xclip \
      stow \
      wget \
      fd-find \
      ripgrep
      
   snap install spotify dbeaver-ce
   # pip install --user spotify-cli-linux awscli awscli-local

   source $BASEDIR/installers/docker.sh
   source $BASEDIR/installers/fastfetch.sh
   source $BASEDIR/installers/nvm.sh
   source $BASEDIR/installers/poetry.sh
   source $BASEDIR/installers/pyenv.sh
   source $BASEDIR/installers/tmux.sh
   source $BASEDIR/installers/zsh.sh

   usermod -s /bin/zsh $USER
else
   echo "No scripts prepared for $DISTRO"
   exit 73
fi
