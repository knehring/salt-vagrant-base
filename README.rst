=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/knehring/salt-vagrant-test.git
    cd salt-vagrant-test
    vagrant up


This will download an Ubuntu  VirtualBox image and create two virtual
machines for you. One will be a Salt Master named `salt-master` and one will be a Salt
Minion named `salt-minion`.  The Salt Minion will point to the Salt
Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh salt-master
    sudo salt \* test.ping
