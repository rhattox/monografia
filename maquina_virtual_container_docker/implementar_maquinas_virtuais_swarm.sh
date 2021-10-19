#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de criação do ambiente POR MEIO DE SCRIPTS BASH PARA MÁQUINAS VIRTUAIS (VAGRANT && ANSIBLE) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=implementar_maquinas_virtuais_swarm

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log

TEMPO_DE_ESPERA_RAPIDO=5

# COMEÇO DO SCRIPT

echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo "# COMEÇO DO SCRIPT $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora). #" 2>&1>> $LOCALIZACAO_LOGS 
echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo -e "\n" 2>&1>> $LOCALIZACAO_LOGS 

echo "INCIO DO ANSIBLE, MÁQUINA VIRTUAL instalacao_manager, em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/instalacao_manager.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 
echo "FIM DO ANSIBLE, MÁQUINA VIRTUAL instalacao_manager,em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INCIO DO ANSIBLE, MÁQUINA VIRTUAL instalacao_worker_1, em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/instalacao_worker_1.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 
echo "FIM DO ANSIBLE, MÁQUINA VIRTUAL instalacao_worker_1,em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INCIO DO ANSIBLE, MÁQUINA VIRTUAL instalacao_worker_2, em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/instalacao_worker_2.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 
echo "FIM DO ANSIBLE, MÁQUINA VIRTUAL instalacao_worker_2,em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 15 SEGUNDOS em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
