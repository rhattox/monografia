#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de implementação do ambiente de MÁQUINAS VIRTUAIS (ANSIBLE) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=implementar_maquinas_virtuais

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}

LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log

TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA_MEDIO=10

LOCALIZACAO_HOSTS="~/.ssh/known_hosts"

# COMEÇO DO SCRIPT

echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo "# COMEÇO DO SCRIPT $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora). #" 2>&1>> $LOCALIZACAO_LOGS 
echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo -e "\n" 2>&1>> $LOCALIZACAO_LOGS 

echo "Remoção de arquivos de HOST de SSH em: $LOCALIZACAO_HOSTS:  $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
rm -f $LOCALIZACAO_HOSTS
echo "Removido arquivo, tempo de espera de ($TEMPO_DE_ESPERA_RAPIDO) para normalização do uso de processamento: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

echo "INCIO DO ANSIBLE, MÁQUINA VIRTUAL SUITECRM, em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/suitecrm.yml -i ./ansible/hosts  2>&1>> $LOCALIZACAO_LOGS 
echo "FIM DO ANSIBLE, MÁQUINA VIRTUAL SUITECRM,em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INCIO DO ANSIBLE, MÁQUINA VIRTUAL MARIADB, em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
ansible-playbook ./ansible/mariadb.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 
echo "FIM DO ANSIBLE, MÁQUINA VIRTUAL MARIADB,em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 10 SEGUNDOS em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
