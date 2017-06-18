#!/usr/bin/env bash
set -e

sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa

ssh andock-ci@localhost
chmod 600 /home/andock-ci/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add /home/andock-ci/.ssh/id_rsa
cp ssh-config /home/andock-ci/.ssh/config