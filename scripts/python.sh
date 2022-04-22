#! /usr/bin/env sh

PY_VERSION=$1
BUILD_DIR=$2/python
MAKE_COMMAND=$3
CHECK=$4
SUDO=$5

if [ "$CHECK" = "true" ]; then
    if [ -x "$(command -v python3)" ];
    then
        echo "Python 3 is already installed"
        exit 0
    fi
fi

PWD=$(pwd)

git clone --branch=$PY_VERSION --single-branch --depth 1 https://github.com/python/cpython $BUILD_DIR
cd $BUILD_DIR

./configure --with-ensurepip=install --disable-test-modules

$SUDO make -j $(nproc) $MAKE_COMMAND
python$PY_VERSION -m pip install --upgrade pip setuptools

cd $PWD
rm -rf $BUILD_DIR
