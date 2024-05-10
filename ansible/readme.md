# Ansible

Ansible is an open source IT automation engine that automates provisioning, configuration management, application deployment, orchestration, and many other IT processes. It is free to use, and the project benefits from the experience and intelligence of its thousands of contributors.  
https://www.ansible.com/

Some pros:

- reproducible
- fast deployment
- scalable

Important files:

inventory.yml
This file contains a list of your hosts to which playbooks can refer to.

playbook.yml
Contains the tasks/steps that shoud be executed.

See also IaC/IaaC  
https://en.wikipedia.org/wiki/Infrastructure_as_code

## Install Ansible

- https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

### Linux

- `sudo apt install ansible`

### Windows

- install wsl first
- https://learn.microsoft.com/en-us/windows/wsl/install
- `wsl --install`

## Execute Playbooks

- example with a playbook named playbook-example.yml
- `ansible-playbook -i inventory.yml playbook-example.yml -K`
- `-K` if become/sudo is needed
