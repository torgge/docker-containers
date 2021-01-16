#!/bin/bash

docker run --name nifi \
  -p 8080:8080 \
  -d \
  -v $HOME/docker/nifi/nifi_state:/opt/nifi/nifi-current/state \
  -v $HOME/docker/nifi/nifi_db:/opt/nifi/nifi-current/database_repository \
  -v $HOME/docker/nifi/nifi_flowfile:/opt/nifi/nifi-current/flowfile_repository \
  -v $HOME/docker/nifi/nifi_content:/opt/nifi/nifi-current/content_repository \
  -v $HOME/docker/nifi/nifi_provenance:/opt/nifi/nifi-current/provenance_repository \
  --net postgres-network \
  apache/nifi:latest

docker exec -i -t nifi /bin/bash
echo "java.arg.8=-Duser.timezone=America/Sao_Paulo" >> conf/bootstrap.conf &&
cd lib &&
wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.20/mysql-connector-java-8.0.20.jar &&
wget https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.8.0.0/ojdbc8-19.8.0.0.jar &&
wget https://jdbc.postgresql.org/download/postgresql-42.2.18.jar &&
wget https://s3.amazonaws.com/rds-downloads/rds-ca-2019-root.pem &&
wget https://repo1.maven.org/maven2/org/apache/nifi/nifi-kite-nar/1.12.1/nifi-kite-nar-1.12.1.nar

##camiho driver  /opt/nifi/nifi-current/lib/postgresql-42.2.18.jar