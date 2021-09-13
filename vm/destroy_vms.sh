#!/bin/bash

echo "Começo dos testes DESTROY em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 

echo "Inicialização DESTROY APP (suitecrm) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 
vagrant destroy app_suitecrm -f >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 

echo "Sleep de 10s" >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 
sleep 10

echo "Inicialização DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 
vagrant destroy db_suitecrm -f >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 

echo "Sleep de 10s" >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 
sleep 10

echo "Finalização da rodada CREATE APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/destroy_vms.log 2>> ./logs/destroy_vms.log 
