#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"
SCRIPTS_PATH="$BASE_PATH/scripts"

echo "🔧 Initiating deployment namespace..."
kubectl apply -f $BASE_PATH/global/namespace.yaml

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 061039760516.dkr.ecr.ap-south-1.amazonaws.com

aws ecr get-login-password --region ap-south-1 | \
kubectl create secret docker-registry ecr-regcred \
--docker-server=061039760516.dkr.ecr.ap-south-1.amazonaws.com \
--docker-username=AWS \
--docker-password=$(aws ecr get-login-password --region ap-south-1)