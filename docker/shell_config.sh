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
    __COUNT_OF_IMAGES=$(docker images | grep "jupyter" | awk "{print $2}" | grep "$1" | wc -l)
    if [ $__COUNT_OF_IMAGES -eq 0 ];
    then
        __build_jupyter_image $1
    fi
    docker run -d -p 8888:8888 jupyter:$1
    sleep 10
    xdg-open localhost8888:8888
}

__build_jupyter_image () {
    __CURENT_DIR=$(pwd)
    cd $DOTFILES
    docker build -f ./docker/jupyter.Dockerfile --build-arg PY_VERSION=$1 -t jupyter:$1 .
    cd $__CURENT_DIR
}
