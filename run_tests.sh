#!/usr/bin/env bash
set -e

#curl -fsSL get.docksal.io | sh



inventory_file="tests/inventory-$1"
config_file="tests/$2.yml"

git -C demo-project pull || git clone https://github.com/andock/demo-project.git

  # Create the instance and check it again

ansible-playbook -i $inventory_file $config_file --tags init

ls -al ~/andock/projects/demo-project
ls -al ~/andock/projects/demo-project/master
ls -al ~/andock/projects/demo-project/master/master-demo-project

if [ "$2" = "mounts" ]
    then touch ~/andock/projects/demo-project/master/master-demo-project/docroot/files/test.txt;
fi
ansible-playbook -i $inventory_file $config_file --tags update

ansible-playbook -i $inventory_file $config_file --tags test

ansible-playbook -i $inventory_file $config_file --tags stop

ansible-playbook -i $inventory_file $config_file --tags rm
