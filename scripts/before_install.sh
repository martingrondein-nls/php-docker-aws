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
# environment specific steps
# staging
if [ "$DEPLOYMENT_GROUP_NAME" == "Staging" ]
then
    ECR_REGISTRY=$(aws --region=eu-west-2 ssm get-parameters --name "ecr-registry" --with-decryption --output text --query Parameters[*].Value)
    ECR_VER=$(aws --region=eu-west-2 ssm get-parameters --name "ecr-ver" --with-decryption --output text --query Parameters[*].Value)

    echo "export ECR_REGISTRY=$ECR_REGISTRY" | sudo tee /etc/profile.d/aws_kms.sh
    echo "export ECR_VER=$ECR_VER" | sudo tee  -a /etc/profile.d/aws_kms.sh
    echo "export APP_NAME=$APPLICATION_NAME" | sudo tee  -a /etc/profile.d/aws_kms.sh
fi