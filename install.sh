#!/bin/bash

docker volume create minecraft_data
docker build -t minecraft-server .
docker run -d --restart unless-stopped --name minecraft-server -v minecraft_data:/minecraft -p 19132:19132/udp minecraft-server
