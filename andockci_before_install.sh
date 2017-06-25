#!/usr/bin/env bash
set -e
sudo rm /home/andock-ci/.ssh/id_rsa
sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/.ssh/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa
sudo chmod 600 /home/andock-ci/.ssh/id_rsa
sudo cp ssh-config /home/andock-ci/.ssh/config
sudo chown andock-ci:docker /home/andock-ci/.ssh/config
sudo su andock-ci "eval `ssh-agent -s`"
sudo su andock-ci "ssh-add /home/andock-ci/.ssh/id_rsa"


