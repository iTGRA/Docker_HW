#!/bin/bash

docker build -f Dockerfile -t docker_hw_1:latest . && docker run -p 80:80 docker_hw_1:latest
