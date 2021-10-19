#!/bin/bash

# Script desenvolvido por BRUNO COVIELLO SOUTO.
# Objetivo: Automação do processo de criação do ambiente de MÁQUINAS VIRTUAIS (VAGRANT) para monografia.

# DELCARAÇÃO VARIÁVEIS E FUNÇÕES
SCRIPT_NOME=criar_maquinas_virtuais

data_de_hoje(){
    date +%Y-%m-%d
} 

segundo_agora(){
    date +%H:%M:%S
}


LOCALIZACAO_LOGS=./logs/$SCRIPT_NOME.log

TEMPO_DE_ESPERA_RAPIDO=5
TEMPO_DE_ESPERA_MEDIO=10

# COMEÇO DO SCRIPT

echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo "# COMEÇO DO SCRIPT $SCRIPT_NOME em: $(data_de_hoje) às $(segundo_agora). #" 2>&1>> $LOCALIZACAO_LOGS 
echo "##########################################################################" 2>&1>> $LOCALIZACAO_LOGS 
echo -e "\n" 2>&1>> $LOCALIZACAO_LOGS 

echo "INÍCIO DO VAGRANT, MÁQUINA SUITECRM: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
vagrant up suitecrm >> $LOCALIZACAO_LOGS
echo "FIM DO VAGRANT, MÁQUINA SUITECRM: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

echo "INÍCIO DO VAGRANT, MÁQUINA MARIADB: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
vagrant up mariadb >> $LOCALIZACAO_LOGS
echo "FIM DO VAGRANT, MÁQUINA MARIADB: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 

sleep $TEMPO_DE_ESPERA_RAPIDO

#teste de ping nas máquinas (solução para erro encontrado durante o desenvolvimento)
echo "Remoção de arquivos de HOST de SSH em: $LOCALIZACAO_HOSTS:  $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 
rm -f $LOCALIZACAO_HOSTS

ansible-playbook ./ansible/ssh.yml -i ./ansible/hosts 2>&1>> $LOCALIZACAO_LOGS 

echo "FIM DO SCRIPT $SCRIPT_NOME, TEMPO GASTO EM ESPERA 10 SEGUNDOS em: $(data_de_hoje) às $(segundo_agora)." 2>&1>> $LOCALIZACAO_LOGS 





