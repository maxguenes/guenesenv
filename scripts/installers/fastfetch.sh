#!/bin/bash
set -e

echo "#### Installing Fastfetch ####"
BASEDIR=$(dirname "$0")

if ! which fastfetch >/dev/null; then
  wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.47.0/fastfetch-linux-amd64.deb -O /tmp/fastfetch-linux-amd64.deb
  if [ -f "/tmp/fastfetch-linux-amd64.deb" ]; then
    dpkg -i /tmp/fastfetch-linux-amd64.deb
    rm /tmp/fastfetch-linux-amd64.deb
  fi
fi
