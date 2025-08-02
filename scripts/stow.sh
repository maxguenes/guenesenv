#!/bin/bash
set -e

BASEDIR=$(dirname "$0")

pushd "$BASEDIR/../dotfiles" >/dev/null
echo "Stowing $(pwd)/$1"
stow --adopt -t ~/ "$@"
git checkout -- ./"$@"
popd >/dev/null
