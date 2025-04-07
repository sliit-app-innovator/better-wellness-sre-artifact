#!/bin/bash

BASE_PATH="/home/ec2-user/better-wellness-sre-artifact"

echo "🧹 Deleting Redis..."
kubectl delete -f $BASE_PATH/redis-service/ --ignore-not-found

echo "❌ Deleting image pull secret..."
kubectl delete -f $BASE_PATH/ecr/regcred-secret.yml --ignore-not-found

echo "🧹 Deleting Services..."
kubectl delete svc better-wellness-booking-service -n better-wellness
echo "⛔ Deleted: better-wellness-booking-service"

kubectl delete svc better-wellness-messaging-service -n better-wellness
echo "⛔ Deleted: better-wellness-messaging-service"

kubectl delete svc better-wellness-user-service -n better-wellness
echo "⛔ Deleted: better-wellness-user-service"

kubectl delete svc better-wellness-web-app-service -n better-wellness
echo "⛔ Deleted: better-wellness-web-app-service"

kubectl delete svc redis-service -n better-wellness
echo "⛔ Deleted: redis-service"

echo "🧹 Deleting ConfigMaps..."
kubectl delete cm booking-service-config -n better-wellness
echo "⛔ Deleted: booking-service-config"

kubectl delete cm messaging-service-config -n better-wellness
echo "⛔ Deleted: messaging-service-config"

kubectl delete cm user-service-config -n better-wellness
echo "⛔ Deleted: user-service-config"

kubectl delete cm kube-root-ca.crt -n better-wellness --ignore-not-found
echo "⛔ Deleted: kube-root-ca.crt (if present)"

echo "🗑️ Deleting Deployments..."
kubectl delete deploy better-wellness-booking-deployment -n better-wellness
echo "⛔ Deleted: better-wellness-booking-deployment"

kubectl delete deploy better-wellness-messaging-deployment -n better-wellness
echo "⛔ Deleted: better-wellness-messaging-deployment"

kubectl delete deploy better-wellness-user-deployment -n better-wellness
echo "⛔ Deleted: better-wellness-user-deployment"

kubectl delete deploy better-wellness-web-app -n better-wellness
echo "⛔ Deleted: better-wellness-web-app"

echo "📛 Deleting namespace..."
kubectl delete -f $BASE_PATH/global/namespace.yaml --ignore-not-found

kubectl delete secret ecr-regcred -n better-wellness

echo "✅ Undeployment complete."
