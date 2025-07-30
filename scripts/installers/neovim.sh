#!/bin/bash
echo "#### Installing Neovim ####"

apt_get_packages=(
  neovim
  ripgrep
  "lua5.1"
  luarocks
)

apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
apt-get install --yes "$apt_join_packages"

if [ ! -e "~/Development/neovim/bin/nvim" ]; then
  mkdir -p ~/Development/neovim/
  pushd ~/Development/neovim/ >/dev/null
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar -C ~/Development/neovim -xzf nvim-linux-x86_64.tar.gz
  rm nvim-linux-x86_64.tar.gz
  popd >/dev/null
fi
