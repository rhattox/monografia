#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de criação do ambiente de container (COMPOSE) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=criar_imagem_deploy_imagem

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

echo "INÍCIO do DOCKER-COMPOSE BUILD em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

docker-compose build

echo "FIM do DOCKER-COMPOSE BUILD em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INÍCIO do DOCKER-COMPOSE DEPLOY em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

docker-compose up -d

echo "FIM do DOCKER-COMPOSE DEPLOY em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_MONITORAMENTO

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 5 SEGUNDOS + 12 minutos em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
