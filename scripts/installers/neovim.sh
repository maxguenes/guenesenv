#!/bin/bash
set -e

echo "#### Installing Neovim ####"

apt_get_packages=(
  neovim
  ripgrep
  "lua5.1"
  luarocks
)

apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
sudo apt-get install --yes $apt_join_packages

if [ ! -e "~/Development/neovim/bin/nvim" ]; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar -C ~/Development -xzf nvim-linux-x86_64.tar.gz
  mv ~/Development/nvim-linux-x86_64 ~/Development/neovim
  ln -s ~/Development/neovim/bin/nvim ~/.local/bin/nvim
  rm nvim-linux-x86_64.tar.gz*
fi

if ! which lazygit >/dev/null; then
  pushd ~/Downloads/ >/dev/null

  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/

  rm lazygit.tar.gz*
  rm lazygit*

  popd >/dev/null
fi
