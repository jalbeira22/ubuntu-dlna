#!/bin/bash

docker build -t jalbeira22/ubuntu-dlna .

docker volume create dlna-data

docker cp video-musical.mp4 dlna-data:/var/lib/minidlna/

docker run -d --name dlna-server \
    -p 8200:8200 \
    -p 1900:1900/udp \
    -v dlna-data:/var/lib/minidlna \
    jalbeira22/ubuntu-dlna
