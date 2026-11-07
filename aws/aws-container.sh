# login
aws configure
AWS Access Key ID [****************LM4F]: <ACCESS_KEY>
AWS Secret Access Key [****************65KV]: <SECRET_KEY>
Default region name [us-east-1]: 
Default output format [json]: 

export AWS_PAGER=""
export AWS_REGION=eu-west-1
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Rol de ejecución de tareas (si ya existe, el error "EntityAlreadyExists" es inofensivo)
aws iam attach-role-policy --role-name ecsTaskExecutionRole \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy
aws iam attach-role-policy --role-name ecsInfrastructureRoleForExpressServices \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonECSInfrastructureRoleforExpressGatewayServices

aws iam update-assume-role-policy --role-name ecsTaskExecutionRole \
  --policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ecs-tasks.amazonaws.com"},"Action":"sts:AssumeRole"}]}'
aws iam update-assume-role-policy --role-name ecsInfrastructureRoleForExpressServices \
  --policy-document '{"Version":"2012-10-17","Statement":[{"Sid":"AllowAccessInfrastructureForECSExpressServices","Effect":"Allow","Principal":{"Service":"ecs.amazonaws.com"},"Action":"sts:AssumeRole"}]}'

# Create the default VPC only if the region doesn't have one
if [ -z "$(aws ec2 describe-vpcs --filters Name=is-default,Values=true --query 'Vpcs[].VpcId' --output text)" ]; then
  aws ec2 create-default-vpc
fi
aws ec2 describe-vpcs --filters Name=is-default,Values=true --query 'Vpcs[].VpcId' --output text

# Create a container
aws ecs create-express-gateway-service \
  --service-name hello-express \
  --execution-role-arn arn:aws:iam::$ACCOUNT_ID:role/ecsTaskExecutionRole \
  --infrastructure-role-arn arn:aws:iam::$ACCOUNT_ID:role/ecsInfrastructureRoleForExpressServices \
  --primary-container '{"image":"public.ecr.aws/nginx/nginx:latest","containerPort":80}' \
  --health-check-path "/" \
  --scaling-target '{"minTaskCount":1,"maxTaskCount":2}' \
  --monitor-resources

# Remove resources
aws ecs delete-express-gateway-service --service-arn <arn-del-servicio>