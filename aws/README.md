# Description
PoC Docker on AWS Cloud 

## Create AWS Container
```shell
aws ecs create-express-gateway-service \
  --service-name hello-express \
  --execution-role-arn "$EXEC_ROLE" \
  --infrastructure-role-arn "$INFRA_ROLE" \
  --primary-container '{"image":"public.ecr.aws/nginx/nginx:latest","containerPort":80}' \
  --health-check-path "/" \
  --scaling-target '{"minTaskCount":1,"maxTaskCount":2}' \
  --monitor-resources
┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│Cluster: ✓ arn:aws:ecs:eu-west-1:924628188769:cluster/default                                                                                                                                                                                       ^│
│                                                                                                                                                                                                                                                     │
│Service: ✓ arn:aws:ecs:eu-west-1:924628188769:service/default/hello-express                                                                                                                                                                          │
│                                                                                                                                                                                                                                                     │
│Deployment: ⠹ arn:aws:ecs:eu-west-1:924628188769:service-deployment/default/hello-express/f4tU9KcWRY9928fhI-dBj - IN_PROGRESS                                                                                                                        │
│                                                                                                                                                                                                                                                     │
│ TargetServiceRevision: ✓ arn:aws:ecs:eu-west-1:924628188769:service-revision/default/hello-express/2896794271017586643                                                                                                                              │
│                                                                                                                                                                                                                                                     │
│ TaskDefinition: ✓ arn:aws:ecs:eu-west-1:924628188769:task-definition/default-hello-express:2                                                                                                                                                        │
│                                                                                                                                                                                                                                                     │
│ Updating                                                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│  IngressPaths                                                                                                                                                                                                                                       │
│                                                                                                                                                                                                                                                     │
│   IngressPath: he-f71e05855861490fbe65562187014e67.ecs.eu-west-1.on.aws                                                                                                                                                                             │
│                                                                                                                                                                                                                                                     │
│    LoadBalancer: ⠹ arn:aws:elasticloadbalancing:eu-west-1:924628188769:loadbalancer/app/ecs-express-gateway-alb-758b6fb9/73906daa16204e80 - PROVISIONING                                                                                            │
│     Last updated at: 2026-11-08T00:37:40Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│    LoadBalancerSecurityGroup ⠹ - PROVISIONING                                                                                                                                                                                                       │
│     Last updated at: 2026-11-08T00:37:40Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│    Certificate ⠹ - PROVISIONING                                                                                                                                                                                                                     │
│     Last updated at: 2026-11-08T00:37:40Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│    Listener ⠹ - PROVISIONING                                                                                                                                                                                                                        │
│     Last updated at: 2026-11-08T00:37:40Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│    Rule ⠹ - PROVISIONING                                                                                                                                                                                                                            │
│     Last updated at: 2026-11-08T00:37:40Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│    TargetGroup ⠹ - PROVISIONING                                                                                                                                                                                                                     │
│     Last updated at: 2026-11-08T00:36:53Z                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│  AutoScalingConfiguration                                                                                                                                                                                                                           │
│                                                                                                                                                                                                                                                     │
│   ScalableTarget: ✓ arn:aws:application-autoscaling:::scalable-target/service-default-hello-express - ACTIVE                                                                                                                                        │
│    Last updated at: 2026-11-08T00:37:32Z                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│   ApplicationAutoScalingPolicy: ✓ arn:aws:autoscaling:eu-west-1:924628188769:scalingPolicy:2ab07975-b2a2-44dd-ac67-db72288b2d73:resource/ecs/service/default/hello-express:policyName/ecs-express-gateway-autoscaling-policy-for_arn:aws:ecs:eu-wes │
│t-1:924628188769:service/default/hello-express - ACTIVE                                                                                                                                                                                              │
│    Last updated at: 2026-11-08T00:37:32Z                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│  MetricAlarms                                                                                                                                                                                                                                       │
│                                                                                                                                                                                                                                                     │
│   MetricAlarm: ⠹ default/hello-express/RollbackAlarm - PROVISIONING                                                                                                                                                                                 │
│    Reason: Target Group is not provisioned yet                                                                                                                                                                                                      │
│    Last updated at: 2026-11-08T00:37:32Z                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│  ServiceSecurityGroups                                                                                                                                                                                                                              │
│                                                                                                                                                                                                                                                     │
│   SecurityGroup: ✓ arn:aws:ec2:eu-west-1:924628188769:security-group/sg-011f4909f9a4e116c - ACTIVE                                                                                                                                                  │
│    Last updated at: 2026-11-08T00:37:03Z                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│ Disassociating                                                                                                                                                                                                                                      │
│  <empty>                                                                                                                                                                                                                                            │
│                                                                                                                                                                                                                                                     │
│                                                                                                                                                                                                                                                     │
│                                                                                                                                                                                                                                                    v│
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
Getting updates... ⠹ | up/down to scroll, q to quit
```

Open the container
```shell
https://he-f71e05855861490fbe65562187014e67.ecs.eu-west-1.on.aws/
```

![AWS Container](../images/aws-container.png)

![AWS Portal Container](../images/aws-portal-container.png)

```shell
$ aws ecs delete-express-gateway-service --service-arn arn:aws:ecs:eu-west-1:924628188769:service/default/hello-express
{
    "service": {
        "cluster": "default",
        "serviceName": "hello-express",
        "serviceArn": "arn:aws:ecs:eu-west-1:924628188769:service/default/hello-express",
        "status": {},
        "activeConfigurations": [
            {
                "primaryContainer": {}
            }
        ],
        "createdAt": "2026-11-08T00:36:53.857000+01:00"
    }
}
```