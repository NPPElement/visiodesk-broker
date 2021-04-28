#!/bin/bash
# Остановим и обновим контейнеры
cd /opt/services
sudo docker-compose down
sudo git pull

# Соберем и запустим контейнеры 
cd /opt/services
sudo docker-compose build
sudo docker-compose up -d --force-recreate --remove-orphans

docker run -it ubuntu
docker ps -a
