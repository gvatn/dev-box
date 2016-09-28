# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.33.12"

  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  config.vm.network :forwarded_port, guest: 8888, host: 8888
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 9999, host: 9999

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "3072"
  end

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/ensure-fabric.sh
    cd /vagrant
    fab ensure_ansible
  SHELL
end
