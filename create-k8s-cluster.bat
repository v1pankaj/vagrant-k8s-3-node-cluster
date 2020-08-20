@echo on

vagrant up

vagrant ssh -c "sudo cd /vagrant; ansible-playbook -vvv -i provisioning/inventory/hosts provisioning/playbook.yml" k8smaster
