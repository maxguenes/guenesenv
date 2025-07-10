#!/bin/bash
set -e

BASEDIR=$(dirname "$0")

pushd "$BASEDIR/../dotfiles" > /dev/null
    stow --adopt -t ~/ "$@"
popd  > /dev/null