#!/bin/bash
sudo service docker start
cd /var/www
sudo docker-compose up -d --build