#!/bin/bash

DOCKER_REGISTRY_SERVER=https://${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com
DOCKER_USER=AWS
DOCKER_PASSWORD=`aws ecr get-login-password`

echo Deleting old secret
kubectl delete secret $SECRET_NAME || true

echo Creating new secret
kubectl create secret docker-registry $SECRET_NAME \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD

echo Patching serviceaccount
kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"'${SECRET_NAME}'"}]}'

