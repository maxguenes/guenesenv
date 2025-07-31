#!/bin/bash
set -e

echo "#### Installing Guake ####"

BASEDIR=$(dirname "$0")

if ! which guake >/dev/null; then
  sudo apt-get install --yes "guake"
fi

guake --restore-preferences $BASEDIR/../others/guake.conf
