#!/bin/bash
echo "#### Installing Snap Packages ####"

snap_packages=(
  spotify
  dbeaver-ce
)

snap_join_packages=$(printf " %s" "${snap_packages[@]}")
snap install "$snap_join_packages"
