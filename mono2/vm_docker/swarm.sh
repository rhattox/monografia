#!/bin/bash

# Script para provisionamento + inicialização das máquina virtuais por meio do vagrant.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=swarm_geral

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
LOCALIZACAO_HOSTS="/home/dev/.ssh/known_hosts"

echo "Começo do scrpit $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

./swarm_vagrant.sh

sleep 5

./swarm_ansible.sh

echo "FIM do provisionamento e instalação do swarm inicializadas, tempo de espera de  para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep 10

echo "Começo do deploy da aplicação no SWARM em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_deploy.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

echo "FINALIZAÇÃO DE TODOS OS SERVIÇOS SWARM, tempo de espera de 15 segundos para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 