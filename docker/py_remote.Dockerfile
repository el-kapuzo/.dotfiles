FROM ubuntu:20.04

ARG TAG=0.10.1
ARG USER=py-remote
ARG HOME=/home/py-remote

RUN mkdir -p /tmp \
    && apt-get update -y \
    && apt-get install -y curl \
    && curl -sL https://github.com/casey/just/releases/download/${TAG}/just-${TAG}-x86_64-unknown-linux-musl.tar.gz | tar -C /tmp -xz \
    && cp /tmp/just /usr/local/bin \
    && rm /tmp/just* \
    && apt-get remove --purge -y curl \
    && rm -rf /var/lib/apt/lists/*

COPY justfile /justfile
COPY docker/.build_env /.env

RUN just docker_base_py $USER

# FROM dev_base

ARG PY_VERSION=3.8
# ARG HOME=/home/py-remote

ENV PYTHONBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH=$PATH:/home/py-remote/.local/bin

RUN just docker_py $PY_VERSION

COPY . $HOME/.dotfiles/

RUN chown -R py-remote /home/py-remote/ \
    && echo "source $HOME/.dotfiles/zsh/zshrc" > $HOME/.zshrc
USER py-remote

CMD "/usr/bin/zsh"
