#!/bin/bash

echo "Começo dos testes REMOVE SWARM (DOCKERHUB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/remove_swarm.log 2>> ./logs/remove_swarm.log 

echo "REMOVE SWARM APP (suitecrm) e DB em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/remove_swarm.log 2>> ./logs/remove_swarm.log 
docker stack rm  suitecrm_geral >> ./logs/remove_swarm.log 2>> ./logs/remove_swarm.log 

echo "Sleep de 10s" >> ./logs/remove_swarm.log 2>> ./logs/remove_swarm.log 
sleep 10

echo "Finalização da rodada REMOVE SWARM APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/remove_swarm.log 2>> ./logs/remove_swarm.log 
