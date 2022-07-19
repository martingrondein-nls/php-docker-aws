#!/bin/bash
sudo service docker start
cd /var/www
# Login to the AWS ECR
(aws ecr get-login --region eu-west-2)
# Start everything but the DB container
docker-compose up -d nginx php
# Cleanup
sudo rm -rf /etc/profile.d/aws_kms.sh