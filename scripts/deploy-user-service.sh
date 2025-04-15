#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact/better-wellness-user-service"
CONFIG_FILE="${BASE_PATH}/application-config.yaml"
DEPLOYMENT_FILE="${BASE_PATH}/deployment.yaml"
SERVICE_FILE="${BASE_PATH}/service.yaml"
NAMESPACE="better-wellness"

echo "📦 Applying ConfigMap from: ${CONFIG_FILE}"
kubectl apply -f ../better-wellness-user-service/application-config.yaml -n ${NAMESPACE}

echo "🚀 Applying Deployment from: ${DEPLOYMENT_FILE}"
kubectl apply -f ../better-wellness-user-service/deployment.yaml -n ${NAMESPACE}

echo "🔌 Applying Service from: ${SERVICE_FILE}"
kubectl apply -f ../better-wellness-user-service/service.yaml -n ${NAMESPACE}

echo "✅ User service deployed and exposed successfully!"
