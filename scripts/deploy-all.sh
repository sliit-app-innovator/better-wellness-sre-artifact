#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"
SCRIPTS_PATH="$BASE_PATH/scripts"

echo "🐘 Deploying Redis..."
kubectl apply -f $BASE_PATH/redis-service/

echo "🧠 Deploying User Service..."
bash $SCRIPTS_PATH/deploy-user-service.sh

echo "📅 Deploying Booking Service..."
bash $SCRIPTS_PATH/deploy-booking-service.sh

echo "💬 Deploying Messaging Service..."
bash $SCRIPTS_PATH/deploy-messaging-service.sh

echo "🌐 Deploying Web App..."
bash $SCRIPTS_PATH/deploy-web-app.sh

# echo "🚪 Applying Ingress..."
# kubectl apply -f $BASE_PATH/global/ingress.yaml
# kubectl apply -f $BASE_PATH/global/ingress-api.yaml

echo "✅ All components deployed!"
