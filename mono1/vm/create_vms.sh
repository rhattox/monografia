#!/bin/bash

echo "Começo dos testes STOP (Build + start) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/create_vms.log 2>> ./logs/create_vms.log 

echo "Inicialização APP (suitecrm) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/create_vms.log 2>> ./logs/create_vms.log 
vagrant up app_suitecrm >> ./logs/create_vms.log 2>> ./logs/create_vms.log 

echo "Sleep de 10s" >> ./logs/create_vms.log 2>> ./logs/create_vms.log 
sleep 10

echo "Inicialização DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/create_vms.log 2>> ./logs/create_vms.log 
vagrant up db_suitecrm >> ./logs/create_vms.log 2>> ./logs/create_vms.log 

echo "Sleep de 10s" >> ./logs/create_vms.log 2>> ./logs/create_vms.log 
sleep 10

echo "Finalização da rodada CREATE APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/create_vms.log 2>> ./logs/create_vms.log 
