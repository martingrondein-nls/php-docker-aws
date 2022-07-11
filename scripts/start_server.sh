#!/bin/bash
sudo service docker start
cd /var/www
docker-compose up -d --build