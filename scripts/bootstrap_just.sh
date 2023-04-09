#! /usr/bin/env sh

TAG=$1
COMMAND=$2

curl -sL https://github.com/casey/just/releases/download/${TAG}/just-${TAG}-x86_64-unkown-linux-musl.tar.gz | tar -C $HOME/tmp -xz

chmod +x $HOME/tmp/just

$HOME/tmp/just ${COMMAND}
$HOME/tmp/just cargo_install just
rm $HOME/tmp/just
