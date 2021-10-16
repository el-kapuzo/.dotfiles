#! /bin/bash

if [ "$#" -ne 0 ];
then
    VERSIONS="$@"
else
    VERSIONS="3.6 3.7 3.8 3.9"
fi

echo "Building py-dev container for $VERSIONS"

__pwd=$(pwd)
__dotfile_path=$(dirname $(realpath $0))

cd $__dotfile_path

for PY_VERSION in $VERSIONS;
do
    docker build -f docker/py_remote.Dockerfile --build-arg PY_VERSION=$PY_VERSION -t py-dev:$PY_VERSION .
done

cd $__pwd
