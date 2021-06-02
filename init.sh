#!/bin/bash


docker build -t oracle-jdk-11 . && \
    docker run -dit  --memory="4g" --name dev -v cs2511:/cs2511 \
        oracle-jdk-11:latest
