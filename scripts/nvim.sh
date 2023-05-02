#! /usr/bin/env sh

BRANCH=$1
BUILD_DIR="$2/neovim"
SUDO=$3

PWD=$(pwd)

$SUDO rm /usr/local/bin/nvim
$SUDO rm -r /usr/local/share/nvim

git clone --branch=$BRANCH --single-branch --depth 1 https://github.com/neovim/neovim $BUILD_DIR
cd $BUILD_DIR

make CMAKE_BUILD_TYPE=Release
$SUDO make -j $(nproc) install

cd $PWD
rm -rf $BUILD_DIR
