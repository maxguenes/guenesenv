#!/bin/bash
BASEDIR=$(dirname "$0")

echo "#### Installing Tmux ####"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## After installactions, copy this guy for spotify tracking on statusline :)
#cp "$BASEDIR/../others/tmux/status/spotify.conf"  ~/.tmux/plugins/tmux/status/spotify.conf