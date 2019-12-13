# easy-docker


# NOTE:
This is for arch based systems only. The only part that changes is the instalation script (first.sh) so if you have docker already installed on your system simply run the last line and relog.

----------

To start first run [first.sh](first.sh) and relog/reboot.

Now edit the [Dockerfile](Dockerfile) to include the software you want to download and other commands you want to execute.

The image name that is going to be created (IMAGE_NAME) and the image it is going to be based upon (BASE_IMAGE) are both variables present in the [config.sh](config.sh) file. The defaults should work just fine if you are running a test.

After editing the Dockerfile and config.sh, docker should be up and running and you should be able to execute [run.sh](run.sh) and get a bash shell in your container.

## X11 and Pulseaudio
To get those to work simply uncomment the lines on run.sh that have `# X11` or `# Pulseaudio` before.
This is yet to be automated.

