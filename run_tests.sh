#!/usr/bin/env bash
set -e
inventory_file="tests/inventory-$1"

git -C drupal-8-demo pull || git clone https://github.com/andock-ci/drupal-8-demo.git

ansible-playbook -i $inventory_file tests/test_instance.yml --tags exec

ansible-playbook -i $inventory_file tests/test_instance.yml --tags exec -e "exec_command=sysinfo"

ansible-playbook -i $inventory_file tests/test_instance.yml --tags update

ansible-playbook -i $inventory_file tests/test_instance.yml --tags test

ansible-playbook -i $inventory_file tests/test_instance.yml --tags stop

ansible-playbook -i $inventory_file tests/test_instance.yml --tags rm

  # Create the instance and check it again

ansible-playbook -i $inventory_file tests/test_instance.yml --tags init

sudo ls -al ~/andock-ci/envs
sudo ls -al ~/andock-ci/envs/drupal-8-demo-fin
sudo ls -al ~/andock-ci/envs/drupal-8-demo-fin/drupal-8-demo-fin--master

ansible-playbook -i $inventory_file tests/test_instance.yml --tags update

ansible-playbook -i $inventory_file tests/test_instance.yml --tags test

ansible-playbook -i $inventory_file tests/test_instance.yml --tags stop

ansible-playbook -i $inventory_file tests/test_instance.yml --tags rm
