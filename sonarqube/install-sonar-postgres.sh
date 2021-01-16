#!/bin/bash

#docker rm -f sonarqube
#docker rm -f postgres

docker network create postgres-network

docker run --name postgres \
--restart always \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=dY2bnChgkNnZAiS \
-d \
-v $HOME/docker/postgres:/var/lib/postgresql/data \
-p 5432:5432 \
--net postgres-network postgres


#evitar erro ao iniciar sonarqube: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
sudo sysctl -w vm.max_map_count=262144

docker run --name sonarqube \
-p 9000:9000 \
-e SONARQUBE_JDBC_USERNAME=postgres \
-e SONARQUBE_JDBC_PASSWORD=dY2bnChgkNnZAiS \
-e SONARQUBE_JDBC_URL=jdbc:postgresql://postgres:5432/postgres \
-d \
--net postgres-network sonarqube:latest
