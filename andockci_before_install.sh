#!/usr/bin/env bash
set -e

sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa
sudo chmod 600 /home/andock-ci/.ssh/id_rsa
sudo cp ssh-config /home/andock-ci/.ssh/config
sudo chown andock-ci:docker /home/andock-ci/.ssh/config
pwd
ssh -o StrictHostKeyChecking=no andock-ci@localhost "/home/travis/fin/andoc_ci.sh"


