# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file('servers.yaml')

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Iterate through entries in YAML file
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      srv.vm.box = servers["box"]
      srv.vm.network "private_network", ip: servers["ip"]
      srv.vm.hostname = servers["hostname"]
      srv.vm.network "forwarded_port", guest: servers["guest_port"], host: servers["host_port"] unless servers["guest_port"].nil? || servers["host_port"].nil?
      srv.vm.synced_folder servers["sync-local"], servers["sync-remote"] unless servers["sync-local"].nil? || servers["sync-remote"].nil?
      srv.vm.provider :virtualbox do |vb|
        vb.name = servers["name"]
        vb.memory = servers["ram"]
      end

      unless servers["master_config"].nil?
        srv.vm.provision :salt do |salt|
          salt.master_key = servers["master_key"] unless servers["master_key"].nil?
          salt.master_pub = servers["master_pub"] unless servers["master_pub"].nil?
          #salt.seed_master = {
                              #"salt-minion" => "./salt/keys/salt-minion.pub"
                             #}
          salt.install_type = "stable"
          salt.install_master = true 
          salt.no_minion = true
          salt.verbose = true
          salt.bootstrap_options = "-P"
        end
      end
      
      unless servers["minion_config"].nil?
        srv.vm.provision :salt do |salt|
          salt.minion_id = servers["name"]
          salt.install_type = "stable"
          salt.verbose = true
          salt.bootstrap_options = "-P"
        end
      end

      srv.vm.provision "shell", path: servers["bootstrap"] unless servers["bootstrap"].nil?
    end
  end
end
