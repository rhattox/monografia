#!/bin/bash

echo "Começo da instalação do ansible: $(date)" > /vagrant/timing.txt

CAMINHO_INSTALADORES=/vagrant/instaladores

tar -zxvf $CAMINHO_INSTALADORES/ansible.tgz -C /tmp/

dpkg -i /tmp/ansible/*.deb

ansible-playbook /vagrant/ansible/vms.yml

echo "Começo do deploy das ferramentas: $(date)" >> /vagrant/timing.txt

echo "node  127.0.0.1" >> /etc/hosts

cd /vagrant/files/node

sudo npm install 

sudo npm install express ejs reload morgan 

node server.js&

cd /vagrant/files/php
echo "Finalização do deploy das ferramentas: $(date) " >> /vagrant/timing.txt

php conexao.php

