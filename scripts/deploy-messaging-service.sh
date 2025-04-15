#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact/better-wellness-messaging-service"
CONFIG_FILE="${BASE_PATH}/application-config.yaml"
DEPLOYMENT_FILE="${BASE_PATH}/deployment.yaml"
SERVICE_FILE="${BASE_PATH}/service.yaml"
NAMESPACE="better-wellness"

echo "📦 Applying ConfigMap from: ${CONFIG_FILE}"
kubectl apply -f ${CONFIG_FILE}

echo "🚀 Applying Deployment from: ${DEPLOYMENT_FILE}"
kubectl apply -f ${DEPLOYMENT_FILE}

echo "🔌 Applying Service from: ${SERVICE_FILE}"
kubectl apply -f ${SERVICE_FILE}

echo "✅ Messaging service deployed and exposed successfully!"
