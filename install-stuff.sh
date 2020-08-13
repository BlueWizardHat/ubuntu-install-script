#!/usr/bin/env bash

umask 0022

## ansible 2.9.6
## sudo apt install ansible

# ansible 2.9.11
sudo apt install -y python3-pip
sudo -H pip3 install ansible

export ANSIBLE_NOCOWS=1
#xhost si:localuser:root
ansible-playbook --extra-vars="user=$USER" install-stuff.yml
#xhost -si:localuser:root
