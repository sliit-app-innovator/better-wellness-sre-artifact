#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact/better-wellness-web-app"
DEPLOYMENT_FILE="${BASE_PATH}/deployment.yaml"
SERVICE_FILE="${BASE_PATH}/service.yaml"
NAMESPACE="better-wellness"

echo "🚀 Applying Deployment from: ${DEPLOYMENT_FILE}"
kubectl apply -f ${DEPLOYMENT_FILE}

echo "🔌 Applying Service from: ${SERVICE_FILE}"
kubectl apply -f ${SERVICE_FILE}

echo "✅ User service deployed and exposed successfully!"
