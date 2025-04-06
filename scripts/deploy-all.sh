#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"
SCRIPTS_PATH="$BASE_PATH/scripts"

echo "🔧 Initiating deployment namespace..."
kubectl apply -f $BASE_PATH/global/namespace.yaml

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 061039760516.dkr.ecr.ap-south-1.amazonaws.com
aws ecr get-login-password --region ap-south-1 | kubectl create secret docker-registry ecr-regcred --docker-server=061039760516.dkr.ecr.ap-south-1.amazonaws.com --docker-username=AWS --docker-password=$(aws ecr get-login-password --region ap-south-1) --namespace=better-wellness


echo "🔐 Creating image pull secret (if needed)..."
kubectl apply -f $BASE_PATH/ecr/regcred-secret.yml

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
