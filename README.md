andock.fin (fin docksal livecycle. )
=========

**andock.environment** is a Ansible role which:
* Checks out or pull a repository (e.g. from github) based on project and branch
* Configure docsal based on branch.domain (e.g. master-build.myproject.mydomain.de)
* Runs "fin up" 
* Runs init hook (configurable through hooks/init_tasks.yml)
* Runs update hook (configurable through hooks/update_tasks.yml)
* Runs test hook (configurable through hooks/test_tasks.yml)
* Runs "fin stop"
* Runs "fin rm"
* Clears the instance
  
**The livecycle can be controlled with tags**
* Clears the instance
Requirements
------------

In order to build your apps with Andock, you will need:

* Ansible in your deploy machine
* Docksal
* git on both machines


Role Variables
--------------

```yaml
---
vars:
  git_artifact_repository: git@github.com:andock/drupal-8-demo-build.git # The source repository
  project_name: drupal-8-demo-build # The name of the project
  branch: "master" # The branch to checkout
  domain: "drupal-8-demo.docksal" # The base domain. The final domain will be master.drupal-8-demo.docksal
  hook_init_tasks: "hooks/init_tasks.yml" #Task file for the project init. Run site-install here.  
  hook_update_tasks: "hooks/update_tasks.yml" #Task file for the project init. Run site-install here.

```

Installation
------------

Andock-CI is an Ansible role distributed globally using [Ansible Galaxy](https://galaxy.ansible.com/). In order to install Andock-CI role you can use the following command.

```
$ ansible-galaxy install andock.fin
```

Update
------

If you want to update the role, you need to pass **--force** parameter when installing. Please, check the following command:

```
$ ansible-galaxy install --force andock.fin
```

Dependencies
------------

@TODO

Example Playbook
----------------

@TODO

License
-------

BSD

Author Information
------------------

Christian Wiedemann (christian.wiedemann@key-tec.de)
