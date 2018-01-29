# -*- mode: ruby -*-
# vi: set ft=ruby :




required_plugins = ["vagrant-hostsupdater" , "vagrant-berkshelf", "vagrant-puppet-install"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end


Vagrant.configure("2") do |config|

  config.vm.box = "nrel/CentOS-6.7-x86_64"
  config.vm.box_version = "1.0.0"

  config.hostsupdater.aliases = ["oracle.local"]

  config.vm.network "private_network", ip: "192.168.33.11"

  config.vm.synced_folder "./wildflys", "/home/vagrant/oradb"
  config.vm.synced_folder "./install", "/home/vagrant/install"

  config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
  end

  config.vm.provision "shell", path: "install/install_xe.sh"



  # config.puppet_install.puppet_version = "5.3.3"
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "/Users/karlgharios/OraDB/wildflys/manifests"
  #   puppet.manifest_file = "site.pp"
  #   puppet.module_path = "/Users/karlgharios/OraDB/wildflys/modules"
  # end

end
