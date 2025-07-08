#!/bin/bash
BASEDIR=$(dirname "$0")

echo "#### Installing Fastfetch ####"

if ! which fastfetch2 > /dev/null; then
    wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.47.0/fastfetch-linux-amd64.deb -O /tmp/fastfetch-linux-amd64.deb
    if [ -f "/tmp/fastfetch-linux-amd64.deb" ] ; then
        dpkg -i /tmp/fastfetch-linux-amd64.deb
        rm /tmp/fastfetch-linux-amd64.deb
    fi    
fi

