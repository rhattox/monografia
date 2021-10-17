#!/bin/bash

# Script para inicialização dos serviços e aplicativos por meio do docker compose

# DELCARAÇÃO VARIÁVEIS && FUNCOES
SCRIPT_NOME=deploy_COMPOSE

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
TEMPO_DE_ESPERA=30


#COMEÇO DO SCRIPT

echo "Começo do scrpit $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "INICIALIZAÇÃO DO DEPLOY DO COMPOSE :$(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

docker-compose -f docker-swarm.yml  up -d
echo "Verificando se o aplicativo foi inicializado..." 


docker-compose -f docker-swarm.yml logs | grep  'Starting SuiteCRM setup'

while [ $? -eq 1 ]
do
    echo "passando aqui"
    docker-compose -f docker-swarm.yml logs | grep  'Starting SuiteCRM setup'
    sleep 5
done 

echo "App inicializado, tempo de espera de para normalização do uso de processamento:$(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep $TEMPO_DE_ESPERA


echo "Finalização do $SCRIPT_NOME, serviços disponíveis em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep 300

echo "FINALIZADO ZABBIX  em:  $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 