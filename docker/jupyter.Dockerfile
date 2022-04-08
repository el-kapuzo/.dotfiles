ARG PY_VERSION=3.9

FROM python:${PY_VERSION}-slim

ARG USER=jupyter
ARG USER_UID=1000
ARG USER_GID=1000

RUN python3 -m pip install --upgrade pip \
    && apt-get update -y \
    && apt-get install -y sudo \
    && python3 -m pip install notebook \
    && groupadd --gid $USER_GID $USER \
    &&  useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER -G sudo \
    && echo "jupyter:password" | chpasswd \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

ENV JUPYTER_TOKEN=''
ENV PATH=$PATH:$HOME/.local/bin
ENV PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python$PY_VERSION/site-packages

USER ${USER}

CMD jupyter notebook --ip="*" --NotebookApp.token=''
