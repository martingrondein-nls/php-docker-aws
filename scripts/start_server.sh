#!/bin/bash
sudo service docker start
cd /etc/profile.d
source ./aws_kms.sh
cd /var/www
# Login to the AWS ECR
(aws ecr get-login --region eu-west-2)
# Start everything but the DB container
docker-compose up -d nginx php