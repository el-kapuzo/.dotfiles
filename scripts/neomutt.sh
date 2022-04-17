#! /usr/bin/sh

BRANCH=$1
BUILD_DIR=$2/neomutt
USER_ID=$3
SUDO=$4

PWD=$(pwd)

git clone --branch=$BRANCH --single-branch --depth 1 https://github.com/neomutt/neomutt
cd $BUILD_DIR

./configure
$SUDO make -j $(nproc) install

rm -rf $BUILD_DIR
