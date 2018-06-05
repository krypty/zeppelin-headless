#!/usr/bin/env bash
#
# run-zeppelin-docker.sh - Run Zeppelin container in Docker
#
#                          To stop the container, type `docker stop zeppelin`.

# After running this script point your browser to http://localhost:8080
# If port 8080 is already taken, change the PORT variable below
PORT=8080

mkdir -p logs      # Directory for Zeppelin logs
mkdir -p notebooks # Directory for Zeppelin notebooks
mkdir -p data      # Directory for datasets

docker run \
       -p $PORT:8080 \
       --rm \
       -v $PWD/logs:/logs \
       -e ZEPPELIN_LOG_DIR='/logs' \
       -v $PWD/notebooks:/notebooks \
       -e ZEPPELIN_NOTEBOOK_DIR='/notebooks' \
       -v $PWD/data:/data \
       --name zeppelin \
       myzeppelin
       # apache/zeppelin:0.7.3
