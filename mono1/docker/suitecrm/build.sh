#!/bin/bash

echo "Começo dos testes BUILD em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/build.log 2>> ./logs/build.log 

echo "BUILD APP (suitecrm)em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)"  >> ./logs/build.log 2>> ./logs/build.log 
docker-compose build  >> ./logs/build.log 2>> ./logs/build.log 

echo "Sleep de 10s" >> ./logs/build.log 2>> ./logs/build.log 
sleep 10

echo "Finalização da rodada DEPLOY APP (suitecrm) e DB (mariaDB) em: $(date +%Y-%m-%d) às $(date +%H:%M:%S)" >> ./logs/build.log 2>> ./logs/build.log 
