#!/bin/bash

# Script para provisionamento + inicialização das máquina virtuais por meio do vagrant.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=swarm_vagrant

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
LOCALIZACAO_HOSTS="/home/dev/.ssh/known_hosts"

echo "Começo do scrpit $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "Remoção de arquivos de HOST de SSH em: $LOCALIZACAO_HOSTS:  $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
rm -f $LOCALIZACAO_HOSTS

sleep 1

echo "Inicialização VAGRANT da máquina virtual docker_manager docker_worker_1 docker_worker_2 em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
vagrant up docker_manager docker_worker_1 docker_worker_2 >> $LOCALIZACAO_LOGS

echo "Máquinas docker_manager docker_worker_1  docker_worker_2 inicializadas, tempo de espera de  para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep 1

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/ssh.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts
