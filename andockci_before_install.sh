#!/usr/bin/env bash
set -e

sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa

sudo -u andock-ci chmod 600 ~/.ssh/id_rsa
sudo -u andock-ci eval `ssh-agent -s`
sudo -u andock-ci ssh-add ~/.ssh/id_rsa
sudo -u andock-ci cp ssh-config ~/.ssh/config