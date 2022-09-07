ARG PY_VERSION=3.10

FROM python:${PY_VERSION}-slim

ARG USER=jupyter
ARG USER_UID=1000
ARG USER_GID=1000
ARG HOME=/home/$USER

RUN python3 -m pip install --upgrade pip \
    && apt-get update -y \
    && apt-get install -y sudo \
    && python3 -m pip install notebook \
    && groupadd --gid $USER_GID $USER \
    &&  useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER -G sudo \
    && echo "jupyter:password" | chpasswd \
    && rm -rf /var/lib/apt/lists/* \
    && chown -R $USER: $HOME \
    && chmod -R 0755 $HOME

EXPOSE 8888

ENV JUPYTER_TOKEN=''

USER ${USER}

CMD jupyter notebook --ip="*" --NotebookApp.token=''
