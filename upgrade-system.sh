#!/bin/bash -eux

# apt packages 
sudo apt upgrade
sudo apt update
sudo apt install g++ tmux emacs git python python-pip python-virtualenv \
     tig mosh dconf-cli

# Go install
wget 'https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz'
sudo tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz

# Nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

# Docker install
# https://docs.docker.com/engine/installation/linux/ubuntulinux/

# Change default shell to fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
sudo chsh -s /usr/bin/fish

# Disable annoying HUD triggered by Alt key
dconf write /org/compiz/integrated/show-hud '[""]'
