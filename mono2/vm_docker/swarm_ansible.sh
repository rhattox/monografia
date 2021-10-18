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

echo "INICIALIZAÇÃO da automação do ANSIBLE em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_mgr.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_wkr01.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

sleep 5

ansible-playbook /home/dev/git/monografia/mono2/vm_docker/ansible/docker_wkr02.yml -i /home/dev/git/monografia/mono2/vm_docker/ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

sleep 5

echo "FINALIZAÇÃO AUTOMAÇÃO ANSIBLE COM DOCKER INSTALADO E SWARM INICIALIZADO, tempo de espera de 20 segundos para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
