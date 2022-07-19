#!/bin/bash
 export APP_REGISTRY==$(aws --region=eu-west-2 ssm get-parameters --name "ecr-registry" --with-decryption --output text --query Parameters[*].Value)
 export APP_VER==$(aws --region=eu-west-2 ssm get-parameters --name "ecr-ver" --with-decryption --output text --query Parameters[*].Value)