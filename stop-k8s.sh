#!/bin/bash

echo "========================================"
echo "🛑 إيقاف وحذف خدمات Kubernetes..."
echo "🛑 Stopping and Removing Kubernetes Services..."
echo "========================================"

# حذف الموارد بترتيب عكسي لتجنب مشاكل الاعتماديات
# Delete resources in reverse order to avoid dependency issues
kubectl delete -f k8s/phpmyadmin-deployment.yml
kubectl delete -f k8s/nginx-deployment.yml
kubectl delete -f k8s/ecom-deployment.yml
kubectl delete -f k8s/mysql-deployment.yml
kubectl delete -f k8s/nginx-config.yml
kubectl delete -f k8s/db-config.yml

echo "========================================"
echo "🧹 تم حذف جميع الموارد بنجاح!"
echo "🧹 All Kubernetes resources deleted successfully!"
echo "========================================"
