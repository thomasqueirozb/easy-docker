# easy-docker


# Support:
This project's [instalation script](aux/first.sh) only officially supports Arch based distributions. However it also uses the official [docker instalation script](https://https://get.docker.com/), which support a variety of other distributions. Check their official github repo [here](https://github.com/docker/docker-install) for more information. If your system isn't supported the only part that changes is the instalation script (first.sh). When you get docker installed on your system simply run the last line and relog.

All scripts heavily rely on the usage of **systemd** services. If your distribution doesn't run on systemd, basically none of the scripts present here will work.


----------

## Usage:

To start first run [first.sh](aux/first.sh) and relog/reboot.

Now edit the [Dockerfile](aux/Dockerfile) to include the software you want to download and other commands you want to execute.

The image name that is going to be created (IMAGE_NAME) and the image it is going to be based upon (BASE_IMAGE) are both variables present in the [config.sh](config.sh) file. The defaults should work just fine if you are running a test.

After editing the Dockerfile and config.sh, docker should be up and running and you should be able to execute [run.sh](aux/run.sh) and get a bash shell in your container.

### X11 and Pulseaudio
To get those to work simply uncomment the lines on run.sh that have `# X11` or `# Pulseaudio` before.
This is yet to be automated.

