# Kubernetes 4 node Cluster using Vagrant and Ansible

This is a sample project to create a 4 node cluster (Master = 1, Workers = 3). Vagrantfile creates 4 Virtual VMs in VirtualBox and then ansible scripts are used to install prequisite softwares required to configure and run Kubernetes.

# How to create Kubernetes Cluster

Run following commands on a terminal to clone this project and then execute a script which creates all VMs, Installs Kubernetes binaries, Creates a Cluster with 4 nodes and then joins 3 worker nodes with master:

```
$ git clone https://github.com/v1pankaj/vagrant-k8s-4-node-cluster.git
$ cd vagrant-k8s-4-node-cluster
$ ./create-k8s-cluster.sh
```

Once the script execution completes, execute following command to verify the cluster:

```
$ vagrant ssh k8smaster
$ sudo kubectl get pods --all-namespaces -o wide
```



