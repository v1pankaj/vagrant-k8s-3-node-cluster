#!/bin/sh

## creating all k8s VMs
vagrant up

### Logging into k8smaster vbox machine ###
vagrant ssh -c "cd /vagrant; ansible-playbook -vvv -i provisioning/inventory/hosts provisioning/playbook.yml" k8smaster
