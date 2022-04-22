#! /usr/bin/env sh

BUILD_DIR=$1/RobotMono
TARGET_DIR=$HOME/.local/share/fonts/truetype/robotomono

git clone --depth=1 https://github.com/googlefonts/RobotoMono $BUILD_DIR

rm $BUILD_DIR/fonts/ttf/*Light*
rm $BUILD_DIR/fonts/ttf/*Medium*
rm $BUILD_DIR/fonts/ttf/*Thin*

mkdir -p $TARGET_DIR
cp -f $BUILD_DIR/fonts/ttf/*.ttf $TARGET_DIR
fc-cache -f -v

rm -rf $BUILD_DIR
