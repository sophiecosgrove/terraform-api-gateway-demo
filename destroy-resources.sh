#!/usr/bin/env bash
cd ./account/environment/services/ecs-frontend
terraform destroy -auto-approve
cd ../ecs-backend-users
terraform destroy -auto-approve
cd ../api-gateway
terraform destroy -auto-approve
cd ../cluster
terraform destroy -auto-approve
cd ../code-deploy
terraform destroy -auto-approve
cd ../load-balancers
terraform destroy -auto-approve
cd ../s3
terraform destroy -auto-approve
cd ../dynamodb
terraform destroy -auto-approve
cd ../rds
terraform destroy -auto-approve
cd ../../infrastructure/vpc
terraform destroy -auto-approve