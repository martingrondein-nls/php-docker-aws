# #!/bin/bash
yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose && chmod +x /usr/bin/docker-compose && docker-compose --version
sudo usermod -a -G docker ec2-user
docker info