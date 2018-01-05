# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.define "zookeeperhost-1" do |zookeeperhostone|
  zookeeperhostone.vm.hostname = "zookeeperhost-1"
  zookeeperhostone.vm.network :private_network, ip: "192.168.99.42"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  zookeeperhostone.vm.box_check_update = true
  zookeeperhostone.vm.provision "shell", path: "provision/setup.sh", args: "192.168.99.42" 
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  zookeeperhostone.vm.synced_folder "data/", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  zookeeperhostone.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus = 2
    vb.name = "zookeeperhostone"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  end
  config.vm.define "zookeeperhost-2" do |zookeeperhosttwo|
    zookeeperhosttwo.vm.hostname = "zookeeperhost-2"
    zookeeperhosttwo.vm.network :private_network, ip: "192.168.99.43"
    zookeeperhosttwo.vm.box_check_update = true
    zookeeperhosttwo.vm.synced_folder "data/", "/vagrant_data"
    zookeeperhosttwo.vm.provision "shell", path: "provision/setup.sh", args: "192.168.99.43"
      zookeeperhosttwo.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
      vb.name = "zookeeperhosttwo"
    end
  end
  config.vm.define "zookeeperhost-3" do |zookeeperhostthree|
    zookeeperhostthree.vm.hostname = "zookeeperhost-3"
    zookeeperhostthree.vm.network :private_network, ip: "192.168.99.44"
    zookeeperhostthree.vm.box_check_update = true
    zookeeperhostthree.vm.synced_folder "data/", "/vagrant_data"
    zookeeperhostthree.vm.provision "shell", path: "provision/setup.sh", args: "192.168.99.44"
      zookeeperhostthree.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
      vb.name = "zookeeperhostthree"
    end
  end
  # config.vm.define "zookeeperhost-4" do |zookeeperhostfour|
  #   zookeeperhostfour.vm.hostname = "zookeeperhost-4"
  #   zookeeperhostfour.vm.network :private_network, ip: "192.168.99.45"
  #   zookeeperhostfour.vm.box_check_update = true
  #   zookeeperhostfour.vm.synced_folder "data/", "/vagrant_data"
  #   zookeeperhostfour.vm.provision "shell", path: "provision/setup.sh", args: "192.168.99.45"
  #     zookeeperhostfour.vm.provider "virtualbox" do |vb|
  #     vb.memory = "1024"
  #     vb.cpus = 2
  #     vb.name = "zookeeperhostfour"
  #   end
  # end
end
