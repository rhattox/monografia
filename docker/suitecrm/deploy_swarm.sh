#!/bin/bash

echo "Começo dos testes DEPLOY SWARM (DOCKERHUB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/deploy_swarm.log 2>> ./logs/deploy_swarm.log 

echo "DEPLOY APP (suitecrm) e DB em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/deploy_swarm.log 2>> ./logs/deploy_swarm.log 
docker stack deploy -c docker-compose.yml suitecrm_geral >> ./logs/deploy_swarm.log 2>> ./logs/deploy_swarm.log 

echo "Sleep de 10s" >> ./logs/deploy_swarm.log 2>> ./logs/deploy_swarm.log 
sleep 10

echo "Finalização da rodada DEPLOY APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/deploy_swarm.log 2>> ./logs/deploy_swarm.log 
