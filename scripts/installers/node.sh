#!/bin/bash
set -e

echo "#### Installing Node ####"

apt_get_packages=(
  nodejs
)

apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
apt-get install --yes "$apt_join_packages"

if ! which nvm >/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi
