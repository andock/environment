#!/usr/bin/env bash
set -e
sudo rm /home/andock-ci/.ssh/id_rsa
sudo cp /home/travis/.ssh/id_rsa /home/andock-ci/.ssh/id_rsa
sudo chown andock-ci:docker /home/andock-ci/.ssh/id_rsa
sudo chmod 600 /home/andock-ci/.ssh/id_rsa
sudo cp ssh-config /home/andock-ci/.ssh/config
sudo chown andock-ci:docker /home/andock-ci/.ssh/config
pwd
#ssh -o StrictHostKeyChecking=no andock-ci@localhost "/home/travis/build/andock-ci/fin/andoc_ci.sh"
sudo -u andock-ci ./andoc_ci.sh


