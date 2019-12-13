#!/bin/sh

. ./config.sh

# X11
# xhost +

# # Pulseaudio
# if ! ( [ -f /tmp/pulseaudio.socket ] ); then
#     cp pulseaudio.client.conf /tmp/pulseaudio.client.conf
#     pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
# fi

if ! systemctl is-active --quiet docker.service; then
    echo "Insert password to start docker"
    sudo systemctl start --now docker.service
    systemctl is-active --quiet docker.service || { echo "You need to start docker!"; exit 1; }
fi


docker_images=$(docker images -q $IMAGE_NAME)
if [ -z "$docker_images" ]; then
    echo "Docker image not found"
    echo "Building image..."
    echo
    if sh build.sh; then
        echo "Build successful!"
        echo "Starting container..."
    else
        echo "An error ocurred during the build"
        echo "Try running ./build.sh again"
        exit 3
    fi
fi

echo Starting container...

docker run -ti --rm \
    -v ~/.bashrc:/home/docker/.bashrc \
    -v ~/.bash/:/home/docker/.bash/ \
    -v ~/.inputrc/:/home/docker/.inputrc/ \
    -v /etc/inputrc:/etc/inputrc \
    -w /home/docker \
    --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
    $IMAGE_NAME "/bin/bash"

# Enable ptrace
    # --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \

# Shared folder
    # -v "$(pwd)"/shared:/home/docker/shared \

# X11
    # -e DISPLAY="$DISPLAY" \
    # -v /tmp/.X11-unix:/tmp/.X11-unix \

# Pulseaudio
    # -e PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    # -e PULSE_COOKIE=/tmp/pulseaudio.cookie \
    # -v /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    # -v /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
