#!/usr/bin/env bash

#echo "Setting up saltstack PPA"
#sudo apt-get install software-properties-common python-software-properties -y >> /dev/null
#sudo add-apt-repository ppa:saltstack/salt -y >> /dev/null
#sudo apt-get update >> /dev/null

#echo "Installing salt-minion"
#sudo apt-get install salt-minion -y >> /dev/null
echo "Copying salt-minion config"
sudo cp /vagrant/salt/configs/minion /etc/salt/minion

echo "Copying salt-minion keys"
sudo cp /vagrant/salt/keys/salt-minion.pem /etc/salt/pki/minion/minion.pem
sudo cp /vagrant/salt/keys/salt-minion.pub /etc/salt/pki/minion/minion.pub

echo "Restarting salt-minion"
sudo salt-minion -d
sudo service salt-minion restart
#sudo salt-call state.highstate
