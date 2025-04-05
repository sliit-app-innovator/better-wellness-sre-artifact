#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"

echo "🔧 Creating namespace..."
kubectl apply -f $BASE_PATH/global/namespace.yaml

echo "🔐 Creating image pull secret (if needed)..."
kubectl apply -f $BASE_PATH/ecr/regcred-secret.yml

echo "🐘 Deploying Redis..."
kubectl apply -f $BASE_PATH/redis-service/

echo "🧠 Deploying User Service..."
kubectl apply -f $BASE_PATH/better-wellness-user-service/

echo "📅 Deploying Booking Service..."
kubectl apply -f $BASE_PATH/better-wellness-booking-service/

echo "💬 Deploying Messaging Service..."
kubectl apply -f $BASE_PATH/better-wellness-messaging-service/

echo "🌐 Deploying Web App..."
kubectl apply -f $BASE_PATH/better-wellness-web-app/

echo "🚪 Setting up Ingress..."
kubectl apply -f $BASE_PATH/global/ingress.yaml
kubectl apply -f $BASE_PATH/global/ingress-api.yaml

echo "✅ All components deployed!"
