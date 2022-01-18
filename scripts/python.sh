#! /bin/sh

PY_VERSION=$1
BUILD_DIR={$2}/python
SUDO=$3
MAKE_COMMAND=$4
CHECK=$5

if [ "$CHECK" = "true" ] then;
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

make -j $(nproc)
$SUDO make $MAKE_COMMAND
python$PY_VERSION -m pip install --upgrade pip setuptools

cd $PWD
rm -rf $BUILD_DIR
