#!/bin/bash

docker-compose down 

docker volume prune -f

docker image prune --all -f