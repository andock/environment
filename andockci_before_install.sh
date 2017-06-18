#!/usr/bin/env bash
set -e

sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa
sudo su andock-ci
chmod 600 ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
cp ssh-config ~/.ssh/config
exit