FROM ubuntu:20.04

ARG TAG=0.10.1
ARG USER=py-remote
ARG HOME=/home/$USER

# TODO: maybe have the just binary in an extra docker file
RUN mkdir -p /tmp \
    && apt-get update -y \
    && apt-get install -y curl \
    && curl -sL https://github.com/casey/just/releases/download/${TAG}/just-${TAG}-x86_64-unknown-linux-musl.tar.gz | tar -C /tmp -xz \
    && cp /tmp/just /usr/local/bin \
    && rm /tmp/just* \
    && apt-get remove --purge -y curl \
    && rm -rf /var/lib/apt/lists/*


COPY . $HOME/.dotfiles/


ENV PYTHONBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH=$PATH:/home/py-remote/.local/bin:/build/cargo/bin

RUN cd $HOME/.dotfiles \
    && cp ${HOME}/.dotfiles/docker/.build_env ./.env \
    && just install_py_docker $USER \
    && rm ./.env

RUN chown -R $USER $HOME
USER $USER

CMD "/usr/bin/zsh"
