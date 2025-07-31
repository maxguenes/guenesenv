#!/bin/bash
set -e

echo "#### Installing ZSH ####"

apt_get_packages=(
  zsh
  fzf
  xclip
  fd-find
)

apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
sudo apt-get install --yes $apt_join_packages

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/joshskidmore/zsh-fzf-history-search ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-fzf-history-search
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo usermod -s /bin/zsh "$USER"
