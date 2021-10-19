#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de criação do ambiente POR MEIO DE SCRIPTS BASH PARA MÁQUINAS VIRTUAIS (VAGRANT && ANSIBLE) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=docker_swarm_deploy

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}


LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log

TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA_MEDIO=10
TEMPO_DE_ESPERA_MONITORAMENTO=720 
# COMEÇO DO SCRIPT

echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo "# COMEÇO DO SCRIPT $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora). #" 2>&1>> $LOCALIZACAO_LOGS 
echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo -e "\n" 2>&1>> $LOCALIZACAO_LOGS 

echo "INÍCIO do deploy da aplicação no SWARM em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

ansible-playbook ./ansible/deploy_arquivo.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 5 SEGUNDOS em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
