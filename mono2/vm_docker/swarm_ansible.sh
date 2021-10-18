#!/bin/bash

# Script para provisionamento + inicialização das máquina virtuais por meio do vagrant.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=swarm_ansible

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}
LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log

echo "Começo do scrpit $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "Inicialização ANSIBLE em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_mgr.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_wkr01.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_wkr02.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 

echo "Máquinas COM DOCKER INSTALADO E SWARM INICIALIZADO docker_worker_1  docker_worker_2 inicializadas, tempo de espera de  para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
