# k8s-aws-ecr-updater

## Build
```bash
docker build -t elcweb/k8s-aws-ecr-updater:latest .
docker push elcweb/k8s-aws-ecr-updater
```

## Usage

Environment variables:
- AWS_REGION
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_ACCOUNT
- SECRET_NAME

Run the image with those variables
AWS credentials should have the right to run aws ecr get-login-password
k8s service account should have the right to delete and create the specified secret

TODO: better documentation
TODO: ci/cd pipeline

