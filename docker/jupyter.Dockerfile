ARG PY_VERSION=3.8

FROM python:${PY_VERSION}-slim

ARG USER=jupyter
ARG USER_UID=1000
ARG USER_GID=1000

RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install notebook \
    && groupadd --gid $USER_GID $USER \
    &&  useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USER

EXPOSE 8888

ENV JUPYTER_TOKEN=''
ENV PATH=$PATH:$HOME/.local/bin

USER ${USER}

CMD jupyter notebook --ip="*" --NotebookApp.token=''
