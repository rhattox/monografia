#!/bin/bash

echo "Começo dos testes DEPLOY (ANSIBLE) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 

echo "Remoção de arquivos de HOST em: /home/dev/.ssh/known_hosts: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
rm -f /home/dev/.ssh/known_hosts

echo "Sleep de 10s" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
sleep 10

echo "Deploy APP_SUITECRM ANSIBLE: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
ansible-playbook ./ansible/suitecrm.yml -i ./ansible/hosts >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 

echo "Sleep de 10s"
sleep 10

echo "Deploy DB_SUITECRM ANSIBLE: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
ansible-playbook ./ansible/mariadb.yml -i ./ansible/hosts >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 

echo "Sleep de 10s" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
sleep 10

echo "Finalização da rodada DE DEPLOY APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_vms.log 2>> ./logs/deploy_vms.log 
