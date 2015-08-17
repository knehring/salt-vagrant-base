#!/usr/bin/env bash

#echo "Setting up saltstack PPA"
#sudo apt-get install software-properties-common python-software-properties -y >> /dev/null
#sudo add-apt-repository ppa:saltstack/salt -y >> /dev/null
#sudo apt-get update >> /dev/null

#echo "Installing salt-master"
#sudo apt-get install salt-master -y >> /dev/null
#sudo cp /vagrant/salt/keys/minion.pub /etc/salt/pki/keys/minion.pub
echo "Copying salt-master config"
sudo cp /vagrant/salt/configs/master /etc/salt/master

echo "Pre-seeding minions"
sudo cp /vagrant/salt/keys/salt-minion.pub /etc/salt/pki/master/minions/salt-minion

echo "Restarting salt-master"
sudo service salt-master restart
