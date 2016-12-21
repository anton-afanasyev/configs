#!/bin/bash -eux

# apt packages 
sudo apt upgrade
sudo apt update
sudo apt install g++ tmux emacs git python python-pip python-virtualenv tig

# Go install
wget 'https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz'
sudo tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz

# Nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

# Docker install
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
