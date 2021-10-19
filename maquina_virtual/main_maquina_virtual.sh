#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de criação do ambiente POR MEIO DE SCRIPTS BASH PARA MÁQUINAS VIRTUAIS (VAGRANT && ANSIBLE) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=main_maquina_virtual

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

echo "Começo do script $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

./criar_maquinas_virtuais.sh 

sleep $TEMPO_DE_ESPERA_MEDIO

./implementar_maquinas_virtuais.sh

sleep $TEMPO_DE_ESPERA_MONITORAMENTO

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 10 SEGUNDOS + 12 minutos em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
