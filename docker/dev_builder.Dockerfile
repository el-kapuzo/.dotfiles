FROM ubuntu:20.04


# TODO: cargo variables
ARG USER=dev
ARG USER_UID=1000
ARG USER_GID=1000
ARG HOME=/home/$USER
ARG UID=0
ARG CARGO_HOME=/build/cargo
ARG RUSTUP_HOME=/build/rustup

ENV PATH=${CARGO_HOME}/bin:$PATH \
    DEBIAN_FRONTEND=noninteractive

COPY . $HOME/.dotfiles/

RUN cd $HOME/.dotfiles \
    && chmod +x ./setup.sh \
    && ./setup.sh -d
