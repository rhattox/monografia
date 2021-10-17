#!/bin/bash

# Script para instalação + inicialização dos serviços e aplicativos por meio do ANSIBLE.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=main_vms
SCRIPT_DATA=$(date +%Y-%m-%d)
SCRIPT_TEMPO=$(date +%H:%M:%S)
LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log
TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA=30
TEMPO_DE_LONGO=120
#COMEÇO DO SCRIPT DE BUILD + DEPLOY DAS MÁQUINAS VIRTUAIS

echo "Começo do script $SCRIPT_NOME em: $SCRIPT_DATA às $SCRIPT_TEMPO." 2>&1>> $LOCALIZACAO_LOGS 

echo "Inicio do build em: $SCRIPT_DATA às $SCRIPT_TEMPO." 2>&1>> $LOCALIZACAO_LOGS 
./create_vms.sh 

echo "Inicio do deploy em: $SCRIPT_DATA às $SCRIPT_TEMPO." 2>&1>> $LOCALIZACAO_LOGS 
./deploy_vms.sh

sleep