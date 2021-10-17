#!/bin/bash

echo "Começo dos testes STOP em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 

echo "Inicialização APP (suitecrm) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 
vagrant halt app_suitecrm >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 

echo "Sleep de 10s" >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 
sleep 10

echo "Inicialização DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" > ./logs/stop_vms.log 2>> ./logs/stop_vms.log 
vagrant halt db_suitecrm >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 

echo "Sleep de 10s" >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 
sleep 10

echo "Finalização da rodada APP STOP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/stop_vms.log 2>> ./logs/stop_vms.log 
