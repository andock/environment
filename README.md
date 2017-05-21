andock-ci-fin (fin docksal livecycle. )
=========

**andock-ci-fin** is a Ansible role which:
* Checks out or pull a repository (e.g. from github) based on project and branch
* Configure docksal based on branch.domain (e.g. master-build.myproject.mydomain.de)
* Runs "fin up" 
* Runs init hook (configurable with hooks/init_tasks.yml)
* Runs update hook (configurable with hooks/update_tasks.yml)
* Runs test hook (configurable with hooks/test_tasks.yml)
* Runs "fin stop"
* Runs "fin rm"
* Clears the instance
  
**The livecycle can be controlled with tags**
* Clears the instance
Requirements
------------

In order to build your apps with Andock CI, you will need:

* Ansible in your deploy machine
* Docksal
* git on both machines


Role Variables
--------------

```yaml
---
vars:
  git_repository_path: git@github.com:andock-ci/drupal-8-demo-build.git # The source repository
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
$ ansible-galaxy install andock-ci.andock-ci-fin
```

Update
------

If you want to update the role, you need to pass **--force** parameter when installing. Please, check the following command:

```
$ ansible-galaxy install --force andock-ci.andock-ci-fin
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
