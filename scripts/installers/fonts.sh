#!/bin/bash
set -e

echo "#### Installing Custom Fonts ####"

BASEDIR=$(dirname "$0")

FONTS_TARGET_DIR=~/.fonts
FONTS_TARGET_DIR=$(realpath -m "$FONTS_TARGET_DIR")

pushd "$BASEDIR" >/dev/null

mkdir -p $FONTS_TARGET_DIR

for font_zip in ../others/fonts/*.zip; do
  filename=$(basename -- "$font_zip")
  filename="${filename%.*}"
  mkdir -p $FONTS_TARGET_DIR/$filename

  echo "Installing $font_zip at $FONTS_TARGET_DIR/$filename"
  unzip -o "$font_zip" -d "$FONTS_TARGET_DIR/$filename"
done

fc-cache -fv

popd
