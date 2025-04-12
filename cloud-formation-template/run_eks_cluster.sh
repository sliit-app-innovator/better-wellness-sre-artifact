aws cloudformation create-stack \
  --stack-name BetterWellnessApiGatewayStack \
  --template-body file://better-wellness-vpc-eks.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --region ap-south-1