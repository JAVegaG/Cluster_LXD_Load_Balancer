# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

	virtualmachine = 3

	(1..virtualmachine).each do |i|
		config.vm.define "servidor#{i}" do |machine|
			machine.vm.box = "bento/ubuntu-20.04"
			machine.vm.box_version = "202112.19.0"
			machine.vm.hostname = "servidor#{i}.parcial1.com"
			machine.vm.network "private_network", ip: "192.168.100.1#{i}"
			machine.vm.provision "file", source: "preseed#{i}.yml", destination: "/home/vagrant/preseed.yml"
			machine.vm.provision "file", source: "index#{i}.html", destination: "/home/vagrant/index.html" 
			machine.vm.provision "shell", path: "provisioner#{i}.sh"
			machine.vm.provider "virtualbox" do |v|
				v.name = "parcial1_servidor#{i}_auto"
				v.memory = 1024
				v.cpus = 1
			end
 		end
	end
end