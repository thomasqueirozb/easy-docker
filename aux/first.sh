#!/bin/sh
. /etc/os-release
# if [ "$ID" = "ubuntu" ]; then
    # sudo apt-get update
    # sudo apt-get install apt-transport-https ca-certificates \
    #     curl gnupg-agent software-properties-common
    # curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # sudo add-apt-repository \
    #    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    #    $(lsb_release -cs) stable"

    # sudo apt-get update
    # sudo apt-get install docker-ce docker-ce-cli containerd.io
if [ "$ID" = "arch" ]; then
    sudo pacman -S docker --noconfirm --needed
else
    curl -sSL https://get.docker.com | sh
fi

sudo usermod -a -G docker $USER

echo "Please log out or restart"
