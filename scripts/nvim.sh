#! /usr/bin/sh

BRANCH=$1
BUILD_DIR="$2/neovim"
NVIM_VENV_PATH=$3
USER_ID=$4
SUDO=$5

PWD=$(pwd)
NVIM_PY_PACKAGES="black flake8 flake8-bandit flake8-bugbear isort jedi-language-server pynvim rope"

git clone --branch=$BRANCH --single-branch --depth 1 https://github.com/neovim/neovim $BUILD_DIR
cd $BUILD_DIR
# chmod -R a+rwx .
make CMAKE_BUILD_TYPE=Release
$SUDO make install

if [ user_id -eq 0 ]; then
    python3 -m venv $NVIM_VENV_PATH
    $NVIM_VENV_PATH/bin/python3 -m pip install --upgrade pip setuptools
    $NVIM_VENV_PATH/bin/python3 -m pip install $NVIM_PY_PACKAGES
else
    python3 -m pip install --upgrade pip setuptools
    python3 -m pip install $NVIM_PY_PACKAGES
fi

cd $PWD
rm -rf $BUILD_DIR
