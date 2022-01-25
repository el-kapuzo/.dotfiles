FROM ubuntu:20.04

ARG TAG=0.10.1
ARG USER=py-remote
ARG HOME=/home/$USER

COPY justfile $HOME/.dotfiles/justfile
COPY ./scripts $HOME/.dotfiles/scripts
COPY ./docker/.build_env $HOME/.dotfiles/.env

ENV PYTHONBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH=$PATH:/home/py-remote/.local/bin:/build/cargo/bin

RUN mkdir -p /tmp \
    && apt-get update -y \
    && apt-get install -y curl \
    && curl -sL https://github.com/casey/just/releases/download/${TAG}/just-${TAG}-x86_64-unknown-linux-musl.tar.gz | tar -C /tmp -xz \
    && cp /tmp/just /usr/local/bin \
    && cd $HOME/.dotfiles \
    && just install_py_docker $USER \
    && rm ./.env \
    && rm /tmp/just* 

COPY . $HOME/.dotfiles

RUN chown -R $USER $HOME
USER $USER

CMD "/usr/bin/zsh"
