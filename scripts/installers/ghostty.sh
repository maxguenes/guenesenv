#!/bin/bash
set -e

echo "#### Installing Ghostty ####"

BASEDIR=$(dirname "$0")

if ! which ghostty >/dev/null; then
  wget "https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
  dpkg -i "ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
  rm "ghostty_1.1.3-0.ppa2_amd64_25.04.deb"
fi
