# #!/bin/bash
yum update -y
# install docker
sudo amazon-linux-extras install docker
# other dependencies
sudo yum install iptables-services amazon-ecr-credential-helper
# attempt to start docker
sudo service docker start
# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose && chmod +x /usr/bin/docker-compose && docker-compose --version
# auto-start after reboot
sudo systemctl enable docker
# don’t forget to add your ec2-user to the docker group
sudo usermod -aG docker ec2-user
# check docker info
docker info
# environment specific steps
if [ "$DEPLOYMENT_GROUP_NAME" == "Staging" ]
then
   # do staging only stuff here
   export ECR_REGISTRY=161262460333.dkr.ecr.eu-west-2.amazonaws.com/martin-ecr >> /etc/environment
   export ECR_VER=latest >> /etc/environment
fi