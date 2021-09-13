#!/bin/bash

echo "Começo dos testes de START (máquina 'buildada' -- boottime) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/start_vms.log 2>> ./logs/start_vms.log 

echo "Inicialização APP (suitecrm) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/start_vms.log 2>> ./logs/start_vms.log 
vagrant up app_suitecrm >> ./logs/start_vms.log 2>> ./logs/start_vms.log 

echo "Sleep de 10s"
sleep 10

echo "Inicialização DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/start_vms.log 2>> ./logs/start_vms.log 
vagrant up db_suitecrm >> ./logs/start_vms.log 2>> ./logs/start_vms.log 

echo "Sleep de 10s" >> ./logs/start_vms.log 2>> ./logs/start_vms.log 
sleep 10

echo "Finalização da rodada START APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/start_vms.log 2>> ./logs/start_vms.log 