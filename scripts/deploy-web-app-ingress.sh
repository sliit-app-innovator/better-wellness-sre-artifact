#!/bin/bash

echo "🔧 Initiating deployment namespace..."

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact/global"
INGRESS_FILE="${BASE_PATH}/ingress-web-app.yaml"
NAMESPACE="better-wellness"

echo "📦 Applying Ingress from: ${INGRESS_FILE}"
kubectl apply -f ${INGRESS_FILE}

echo "✅ Ingress service deployed and exposed successfully!"
