#!/bin/bash

CONFIG_DIR="/home/ec2-user/better-wellness-sre-artifact/better-wellness-user-service"
CONFIG_FILE="${CONFIG_DIR}/application.properties"
DEPLOYMENT_FILE="${CONFIG_DIR}/deployment.yaml"
SERVICE_FILE="${CONFIG_DIR}/service.yaml"
NAMESPACE="better-wellness"

echo "📦 Creating or updating ConfigMap..."
kubectl create configmap user-service-config \
  --from-file=application.properties=${CONFIG_FILE} \
  --namespace=${NAMESPACE} --dry-run=client -o yaml | kubectl apply -f -

echo "🚀 Applying Deployment..."
kubectl apply -f ${DEPLOYMENT_FILE}

echo "🔌 Applying Service..."
kubectl apply -f ${SERVICE_FILE}

echo "✅ User service deployed and exposed successfully!"
