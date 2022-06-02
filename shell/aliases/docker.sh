alias dc="docker container"
alias dcl="docker container list"
alias db="docker build"
alias di="docker image"
alias dil="docker images"
alias dr="docker run"


pgadmin () {
    docker run -p 80:80 -e 'PGADMIN_DEFAULT_EMAIL=daniel.pohl@up2parts.com' -e 'PGADMIN_DEFAULT_PASSWORD=password' dpage/pgadmin4
    sleep 10
    xdg-open localhost
}

jupyter () {
    PYVERSION=${1:-"3.9"}
    __COUNT_OF_IMAGES=$(docker images | grep "jupyter" | awk "{print $2}" | grep "$PYVERSION" | wc -l)
    if [ $__COUNT_OF_IMAGES -eq 0 ];
    then
        __build_jupyter_image $PYVERSION
    fi
    docker run -d -p 8888:8888 jupyter:$PYVERSION
    sleep 10
    if [[ $(uname -s) == MINGW* ]];
    then
        start localhost:8888
    else
        xdg-open localhost:8888
    fi
}

__build_jupyter_image () {
    __CURENT_DIR=$(pwd)
    cd $DOTFILES
    docker build -f ./docker/jupyter.Dockerfile --build-arg PY_VERSION=$1 -t jupyter:$1 .
    cd $__CURENT_DIR
}
