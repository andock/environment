#!/usr/bin/env bash
set -e

#curl -fsSL get.docksal.io | sh



inventory_file="tests/inventory-$1"
config_file="tests/$2.yml"

git -C drupal-8-demo pull || git clone https://github.com/andock-ci/drupal-8-demo.git

ansible-playbook -i $inventory_file $config_file --tags exec

ansible-playbook -i $inventory_file $config_file --tags exec -e "exec_command=sysinfo"

ansible-playbook -i $inventory_file $config_file --tags update

ansible-playbook -i $inventory_file $config_file --tags test

ansible-playbook -i $inventory_file $config_file --tags stop

ansible-playbook -i $inventory_file $config_file --tags rm

  # Create the instance and check it again

ansible-playbook -i $inventory_file $config_file --tags init

sudo ls -al ~/andock-ci/envs
sudo ls -al ~/andock-ci/envs/drupal-8-demo-fin
sudo ls -al ~/andock-ci/envs/drupal-8-demo-fin/drupal-8-demo-fin--master

ansible-playbook -i $inventory_file $config_file --tags update

ansible-playbook -i $inventory_file $config_file --tags test

ansible-playbook -i $inventory_file $config_file --tags stop

ansible-playbook -i $inventory_file $config_file --tags rm
