#!/bin/sh
sudo pacman -S docker --noconfirm --needed
sudo usermod -a -G docker $USER

echo "Please log out or restart"
