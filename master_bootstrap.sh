#!/usr/bin/env bash

#echo "Setting up saltstack PPA"
#sudo apt-get install software-properties-common python-software-properties -y >> /dev/null
#sudo add-apt-repository ppa:saltstack/salt -y >> /dev/null
#sudo apt-get update >> /dev/null

#echo "Installing salt-master"
#sudo apt-get install salt-master -y >> /dev/null
#sudo cp /vagrant/salt/keys/minion.pub /etc/salt/pki/keys/minion.pub
sudo cp /vagrant/salt/configs/master /etc/salt/master

#echo "Restarting salt-master"
#sudo salt-master -d
#sudo service salt-master restart
