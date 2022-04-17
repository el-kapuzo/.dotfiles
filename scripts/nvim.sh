#! /usr/bin/sh

BRANCH=$1
BUILD_DIR="$2/neovim"
NVIM_VENV_PATH=$3
USER_ID=$4
SUDO=$5

PWD=$(pwd)
NVIM_PY_PACKAGES="black flake8 flake8-bandit flake8-bugbear flake8-implicit-str-concat flake8-eradicate flake8-debugger falke8-commas flake8-broken-line isort jedi-language-server pynvim rope"

git clone --branch=$BRANCH --single-branch --depth 1 https://github.com/neovim/neovim $BUILD_DIR
cd $BUILD_DIR

make CMAKE_BUILD_TYPE=Release
$SUDO make install

cd $PWD
rm -rf $BUILD_DIR
