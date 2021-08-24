# Internal Amazon API Gateway with Terraform

## Deployment Order
In order to avoid dependency issues it is recommended to execute deployment of resources in the following order:
1. [ VPC ](#vpc)
2. [ Relational Database ](#relational-database)
3. [ DynamoDB ](#dynamodb)
4. [ S3 ](#s3-bucket)   
5. [ Load Balancers ](#load-balancers)

### VPC
####To deploy:
``` 
    cd account/environment/infrastructure/vpc
    terraform init
    terraform apply
```

### Relational Database
* Used by the backend users application to persist data.
####To deploy:

```
    cd account/environment/services/rds
    terraform init
    terraform apply
```
You will be prompted for a username and password after executing terraform apply, you can enter your own custom values.

### DynamoDB
* Used by the backend products application to persist data
####To deploy:
```
    cd account/environment/services/dynamodb
    terraform init
    terraform apply
```

### S3 Bucket
* Used by the backend products application to post and persist images.
#### To deploy:
```
    cd account/environment/services/s3
    terraform init
    terraform apply
```

###Load Balancers
* Configured to allow traffic on port 80 from a personal IP address. If secure access for the public is required uncomment and follow the instructions in modules/support/services/load-balancers/listeners.tf.

####To deploy:

```
    cd account/environment/services/load-balancer
    terraform init
    terraform apply
```
