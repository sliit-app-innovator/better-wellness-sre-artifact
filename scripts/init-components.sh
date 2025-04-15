#!/bin/bash
BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"
SCRIPTS_PATH="$BASE_PATH/scripts"

echo "🐘 Configuring Redis and Database..."
kubectl apply -f $BASE_PATH/redis-service/

echo "🐘 Deploying kubeneties Namespas..."
kubectl apply -f $BASE_PATH/global/namespace.yaml
