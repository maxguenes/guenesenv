#!/bin/bash
echo "#### Installing Guake ####"

BASEDIR=$(dirname "$0")

if which guake >/dev/null; then
  apt-get install --yes "guake"
  guake --restore-preferences $BASEDIR/guake.conf
fi
