$commonscript = <<-SCRIPT
sudo echo "192.168.10.100   k8smaster.local      k8smaster" >> /etc/hosts
sudo echo "192.168.10.101   k8snode1.local       k8snode1" >> /etc/hosts
sudo echo "192.168.10.102   k8snode2.local       k8snode2" >> /etc/hosts
sudo echo "192.168.10.103   k8snode3.local       k8snode3" >> /etc/hosts
SCRIPT

$addingsshkeys = <<-SCRIPT
ssh-keyscan -t rsa -H k8smaster.local >> /home/vagrant/.ssh/known_hosts
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20200229.0.0"
  virtualbox__intnet = "k8s_network"

  config.vm.define "k8smaster" do |k8smaster|
   k8smaster.vm.box = "ubuntu/xenial64"
   k8smaster.vm.box_version = "20200229.0.0"
   k8smaster.vm.network "private_network",ip:"192.168.10.100",netmask:"255.255.0.0",
   virtualbox__intnet: true
   k8smaster.vm.hostname = "k8smaster"
   k8smaster.vm.provision "shell", inline: $addingsshkeys
   k8smaster.vm.provision "shell", inline: $commonscript
  config.vm.provision "shell",
   inline: 'sudo apt update; sudo apt-get install -y python-pip; sudo pip install --upgrade pip; sudo pip install --upgrade ansible==2.9.0'
  end

  config.vm.define "k8snode1" do |k8snode1|
   k8snode1.vm.box = "ubuntu/xenial64"
   k8snode1.vm.box_version = "20200229.0.0"
   k8snode1.vm.network "private_network",ip:"192.168.10.101",netmask:"255.255.0.0",
   virtualbox__intnet: true
   k8snode1.vm.hostname = "k8snode1"
   k8snode1.vm.provision "shell", inline: $addingsshkeys
   k8snode1.vm.provision "shell", inline: $commonscript
  end

  config.vm.define "k8snode2" do |k8snode2|
   k8snode2.vm.box = "ubuntu/xenial64"
   k8snode2.vm.box_version = "20200229.0.0"
   k8snode2.vm.network "private_network",ip:"192.168.10.102",netmask:"255.255.0.0",
   virtualbox__intnet: true
   k8snode2.vm.hostname = "k8snode2"
   k8snode2.vm.provision "shell", inline: $addingsshkeys
   k8snode2.vm.provision "shell", inline: $commonscript
  end

  config.vm.define "k8snode3" do |k8snode3|
   k8snode3.vm.box = "ubuntu/xenial64"
   k8snode3.vm.box_version = "20200229.0.0"
   k8snode3.vm.network "private_network",ip:"192.168.10.103",netmask:"255.255.0.0",
   virtualbox__intnet: true
   k8snode3.vm.hostname = "k8snode3"
   k8snode3.vm.provision "shell", inline: $addingsshkeys
   k8snode3.vm.provision "shell", inline: $commonscript
  end

  # allow guests to reach each other by hostname
  config.vm.provision "allow_guest_host_resolution",
   type: "shell",
   inline: 'apt-get install -y avahi-daemon libnss-mdns'

end
