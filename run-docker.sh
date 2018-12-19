#!/bin/bash
export SSH_AUTH_SOCK_DIR=$(dirname $SSH_AUTH_SOCK)
docker run -it \
       --mount type=bind,source=${HOME}/shared,target=/shared \
       --mount type=bind,source=${HOME}/.gitconfig,target=/root/.gitconfig,readonly \
       --mount type=bind,source=/tmp/.X11-unix,target=/tmp/.X11-unix \
       --mount type=bind,source=${HOME}/.Xauthority,target=/root/.Xauthority \
       --mount type=bind,source=${SSH_AUTH_SOCK_DIR},target=${SSH_AUTH_SOCK_DIR} \
       -e DISPLAY=${DISPLAY} \
       -e SSH_AUTH_SOCK=${SSH_AUTH_SOCK} \
       --ipc=host \
       --net=host \
       python-dev /usr/bin/tmux
