#!/usr/bin/env bash
set -e

#curl -fsSL get.docksal.io | sh



inventory_file="tests/inventory-$1"
config_file="tests/$2.yml"

git -C demo-project pull || git clone https://github.com/andock/demo-project.git

ansible-playbook -i $inventory_file $config_file --tags exec

ansible-playbook -i $inventory_file $config_file --tags exec -e "exec_command=sysinfo"

ansible-playbook -i $inventory_file $config_file --tags update

ansible-playbook -i $inventory_file $config_file --tags test

ansible-playbook -i $inventory_file $config_file --tags stop

ansible-playbook -i $inventory_file $config_file --tags rm

  # Create the instance and check it again

ansible-playbook -i $inventory_file $config_file --tags init

ls -al ~/andock/projects/demo-project
ls -al ~/andock/projects/demo-project/envs
ls -al ~/andock/projects/demo-project/envs/demo-project--master

if [ "$2" = "share" ]

    then cd ~/andock/projects/demo-project/envs/demo-project--master/docroot/files; touch test.txt
    exit
fi
ansible-playbook -i $inventory_file $config_file --tags update

ansible-playbook -i $inventory_file $config_file --tags test

ansible-playbook -i $inventory_file $config_file --tags stop

ansible-playbook -i $inventory_file $config_file --tags rm
