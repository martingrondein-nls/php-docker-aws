#!/bin/bash
sudo service docker start
cd /var/www
# Login to the AWS ECR
(aws ecr get-login --region eu-west-2)
# Start everything but the DB container
sudo docker-compose up -d nginx php