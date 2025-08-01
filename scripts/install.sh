#!/bin/bash
set -e

BASEDIR=$(dirname "$0")
DISTRO="$(lsb_release -d | awk -F"\t" '{print $2}')"

echo "Using distro: $DISTRO"

if [[ $DISTRO =~ "Ubuntu" ]]; then
  echo "Installing Ubuntu packages"

  apt_get_packages=(
    btop
    git
    curl
    openjdk-21-jdk
    postgresql-client
    stow
    wget
    gcc
    build-essential
  )

  apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
  sudo apt-get update
  sudo apt-get install --yes $apt_join_packages
  # pip install --user spotify-cli-linux awscli awscli-local

  for i in $(ls "$BASEDIR/installers" | grep ".sh"); do
    echo "Running $i"
    bash "$BASEDIR/installers/$i"
  done

  echo "Done installing"

else
  echo "No scripts prepared for $DISTRO"
  exit 73
fi
