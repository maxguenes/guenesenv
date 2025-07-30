#!/bin/bash
set -e

echo "#### Installing Git Tools ####"

BASEDIR=$(dirname "$0")

wget "https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb"
dpkg -i "git-delta_0.18.2_amd64.deb"
rm "git-delta_0.18.2_amd64.deb"

git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff

if ! which gitkraken >/dev/null; then
  wget "https://api.gitkraken.dev/releases/production/linux/x64/active/gitkraken-amd64.deb"
  dpkg -i gitkraken-amd64.deb
  rm gitkraken-amd64.deb
  snap install gitkraken-cli
fi
