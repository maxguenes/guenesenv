#!/bin/bash
set -e

echo "#### Installing Tmux ####"
BASEDIR=$(dirname "$0")

if ! which tmux >/dev/null; then
  apt_get_packages=(
    tmux
  )

  apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
  sudo apt-get install --yes $apt_join_packages

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  ## After installactions, copy this guy for spotify tracking on statusline :)
  #cp "$BASEDIR/../others/tmux/status/spotify.conf"  ~/.tmux/plugins/tmux/status/spotify.conf
fi
