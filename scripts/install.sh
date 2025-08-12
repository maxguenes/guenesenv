#!/bin/bash
set -e

BASEDIR=$(dirname "$0")
DISTRO="$(lsb_release -d | awk -F"\t" '{print $2}')"

echo "Using distro: $DISTRO"

if [[ $DISTRO =~ "Ubuntu" ]]; then
  echo "Requesting superuser permission"
  sudo echo "Installing Ubuntu packages"

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
    net-tools
  )

  apt_join_packages=$(printf " %s" "${apt_get_packages[@]}")
  sudo apt-get update
  sudo apt-get install --yes $apt_join_packages

  for i in $(ls "$BASEDIR/installers" | grep ".sh"); do
    echo "Running $i"
    bash "$BASEDIR/installers/$i"
  done

  echo "Done installing, excuting stow"

  for i in $(ls "$BASEDIR/../dotfiles"); do
    echo "Stow $i"
    bash "$BASEDIR/stow.sh" $i
  done

  echo "Done stowing, excuting after install"
  zsh --login -c "$BASEDIR/after_install.sh"

  echo "Finished installation"
else
  echo "No scripts prepared for $DISTRO"
  exit 73
fi
