#!/bin/bash

# Script para provisionamento + inicialização das máquina virtuais por meio do vagrant.

# DELCARAÇÃO VARIÁVEIS
SCRIPT_NOME=create_vms

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

echo "Inicialização da máquina virtual para App SuiteCRM em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
vagrant up app_suitecrm >> $LOCALIZACAO_LOGS

echo "App inicializado, tempo de espera de  para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
sleep $TEMPO_DE_ESPERA

echo "Inicialização da máquina virtual para App MariaDB em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
vagrant up db_suitecrm >> $LOCALIZACAO_LOGS

echo "Finalização da $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 