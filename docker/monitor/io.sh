#!/bin/bash

x=1

docker stack deploy -c /home/dev/git/monografia/docker/osticket/docker-compose.yml osticket

docker stack deploy -c /home/dev/git/monografia/docker/suitecrm/docker-compose.yml suitecrm

while [ $x -le 20 ] 
do
    echo "Rodada:  $x" >> ./rodada-$(date +%Y-%m-%d).txt
    iostat >> ./rodada-$(date +%Y-%m-%d).txt
    sleep 10
    x=$(( $x + 1 ))
    echo -e "\nFIM\n"  >> ./rodada-$(date +%Y-%m-%d).txt
done