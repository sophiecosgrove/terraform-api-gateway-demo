#!/usr/bin/env bash
#do not execute this script if you haven't initialised terraform modules first
cd ./account/environment/infrastructure/vpc
terraform apply -auto-approve
cd ../../services/rds
terraform apply -auto-approve
cd ../dynamodb
terraform apply -auto-approve
cd ../load-balancers
terraform apply -auto-approve
cd ../code-deploy
terraform apply -auto-approve
cd ../cluster
terraform apply -auto-approve
cd ../api-gateway
terraform apply -auto-approve
cd ../ecs-backend-users
terraform apply -auto-approve
cd ../ecs-frontend
terraform apply -auto-approve