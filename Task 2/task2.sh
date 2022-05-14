#!/usr/bin/env bash

docker network create task2_docker

docker build -f Dockerfile_Backend -t docker_hw2_be:latest .

docker build -f Dockerfile_DB -t docker_hw2_db:latest .

docker run -t docker_hw2_db -p 5432:5432 --net task2_docker docker_hw2_db:latest

docker run -t docker_hw2_be -p 8000:8000 -e DATABASE_HOST=docker_hw2_db --net task2_docker docker_hw2_be:latest
