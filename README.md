# Internal Amazon API Gateway with Terraform

## Deployment Order
In order to avoid dependency issues it is recommended to execute deployment of resources in the following order:
1. [ VPC ](#vpc)
2. [ Relational Database ](#relational-database)
3. [ DynamoDB ](#dynamodb)
4. [ S3 ](#s3-bucket)   
5. [ Load Balancers ](#load-balancers)
6. [ Code Deploy ](#code-deploy)
7. [ ECS Cluster ](#ecs-cluster)
8. [ ECR ](#ecr)
9. [ API Gateway ](#api-gateway)
10. [ Backend Microservice 1 ](#backend-users-service)
11. [ Frontend Microservice ](#frontend-service)
12. [ Backend Microservice 2 ](#backend-products-service)

_Note: Relational Database, DynamoDB and S3 are dependent on the microservices used in this specific implementation. Only use them in your infrastructure if your applications need them, else replace with your own infrastructure and skip to_ [ Load Balancers ](#load-balancers).
### VPC
#### Init and apply from:
``` 
    cd account/environment/infrastructure/vpc
```

### Relational Database
* Used by the backend users application to persist data.
#### Init and apply from:

```
    cd account/environment/services/rds
```


### DynamoDB
* Used by the backend products application to persist data
#### Init and apply from:
```
    cd account/environment/services/dynamodb
```

### S3 Bucket
* Used by the backend products application to post and persist images.
#### Init and apply from:
```
    cd account/environment/services/s3
```

### Load Balancers
* Configured to allow traffic on port 80 from a personal IP address. If secure access for the public is required, uncomment and follow the instructions in [ modules/support/services/load-balancers/listeners.tf ](https://github.com/sophiecosgrove/terraform-api-gateway-demo/blob/readme/modules/support/services/load-balancers/listeners.tf).

#### Init and apply from:

```
    cd account/environment/services/load-balancers
```

### Code Deploy
• Used to implement a blue green deployment style.
#### Init and apply from:
```
    cd account/emvironment/services/code-deploy
```
### ECS Cluster
* The cluster in which all the services reside.

#### Init and apply from:
```
    cd account/emvironment/services/cluster
```

### ECR
* After applying this step you will need to push your images to the repositories before continuing.
#### Init and apply from:
```
    cd account/environment/services/ecr
```

### API Gateway
#### Init and apply from:
```
    cd account/environment/services/api-gateway
```

### Backend Users Service
* The first service to go up in order to resolve dependency issues.
#### Init and apply from:
```
    cd account/environment/services/ecs-backend-users
```
### Frontend Service
#### Init and apply from:
```
    cd account/environment/services/ecs-frontend
```
### Backend Products Service
#### Init and apply from:
```
    cd account/environment/services/ecs-backend-products
```