FROM ubuntu:20.04

ARG TAG=0.10.1

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

RUN just docker_base_py "py-remote"

