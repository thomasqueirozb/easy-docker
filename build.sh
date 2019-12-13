#!/bin/sh

. ./config.sh

_UID=$(id -u)
_GID=$(id -g)
_GID_NAME=$(id -gn)

sed "s/BASE_IMAGE/$BASE_IMAGE/g;s/_UID/$_UID/g;s/_GID_NAME/$_GID_NAME/g;s/_GID/$_GID/g;" Dockerfile | docker build -t $IMAGE_NAME -
