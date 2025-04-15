#!/bin/bash
BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"
SCRIPTS_PATH="$BASE_PATH/scripts"

echo "🐘 Deploying Redis..."
kubectl apply -f $BASE_PATH/redis-service/

echo "🧠 Deploying User Service..."
bash $SCRIPTS_PATH/deploy-user-service.sh

echo "🧠 Deploying Database Service..."
bash $SCRIPTS_PATH/mysql-deployment.yaml