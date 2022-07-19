# Docker / PHP to AWS deployment demo


## AWS Setup

Please specfify the following variables in AWS:

- AWS_DEFAULT_REGION
- AWS_ACCOUNT_ID
- IMAGE_REPO_NAME
- IMAGE_TAG

## Services Used

- AWS EC2
  - hosted instance
- AWS S3
  - for artifact store
- AWS KMS (Key Management Service) & Parameter Store
  - for storing/retrieving secure credentials
- AWS ECR (Amazon Elastic Container Registry)
  - for Docker image store
- AWS CodeBuild
  - for building and pushing to ECR
- Snyk.io
  - for code scans / vulnerability checks during deployment
- AWS CodeDeploy
  - for deploying to EC2 instance
- AWS CodePipeline
  - for managing the above

## Using KMS

Set a value:
```aws --region=eu-west-2 ssm put-parameter --name "VARIABLE-NAME-GOES-HERE" --value 'VARIABLE-VALUE' --type SecureString --key-id alias/NAME-OF-KMS-ALIAS```

Get a value:
```aws --region=eu-west-2 ssm get-parameters --name "VARIABLE-NAME-GOES-HERE" --with-decryption --output text --query Parameters[*].Value```
