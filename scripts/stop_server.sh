#!/bin/bash
# cd into the active working directory on the ec2 instance
cd /var/www
# bring down the running images
sudo docker-compose down
# check for and then stop the docker service
isExistApp=pgrep docker
if [[ -n $isExistApp ]]; then
sudo service docker stop
fi
# forcefully Remove Containers and Images
sudo docker rm -f $(docker ps -qa)
yes | sudo docker image prune -a