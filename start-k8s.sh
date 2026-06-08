#!/bin/bash

# إنهاء السكريبت في حالة حدوث أي خطأ
# Exit immediately if a command exits with a non-zero status
set -e

echo "========================================"
echo "🚀 بدء تشغيل خدمات Kubernetes..."
echo "🚀 Starting Kubernetes Services..."
echo "========================================"

# 1. تطبيق ملفات الإعدادات (ConfigMaps)
# Apply configurations
echo "⚙️ تطبيق الإعدادات (ConfigMaps)..."
echo "⚙️ Applying Configurations..."
kubectl apply -f k8s/db-config.yml
kubectl apply -f k8s/nginx-config.yml

# 2. تشغيل قاعدة البيانات (MySQL)
# Apply MySQL Database Deployment, PVC & Service
echo "🗄️ تشغيل MySQL..."
echo "🗄️ Starting MySQL..."
kubectl apply -f k8s/mysql-deployment.yml

# 3. تشغيل تطبيق المتجر الإلكتروني (Ecommerce)
# Apply Ecommerce App Deployment, PVC & Service
echo "🛍️ تشغيل تطبيق المتجر..."
echo "🛍️ Starting Ecommerce App..."
kubectl apply -f k8s/ecom-deployment.yml

# 4. تشغيل خادم Nginx
# Apply Nginx Web Server Deployment & Service
echo "🌐 تشغيل Nginx..."
echo "🌐 Starting Nginx..."
kubectl apply -f k8s/nginx-deployment.yml

# 5. تشغيل phpMyAdmin
# Apply phpMyAdmin Deployment & Service
echo "🛠️ تشغيل phpMyAdmin..."
echo "🛠️ Starting phpMyAdmin..."
kubectl apply -f k8s/phpmyadmin-deployment.yml

echo "========================================"
echo "🎯 تم تطبيق جميع ملفات Kubernetes بنجاح!"
echo "🎯 All Kubernetes files applied successfully!"
echo "========================================"
echo "ℹ️ لمتابعة حالة الخدمة والـ Pods، استخدم الأمر:"
echo "ℹ️ To check status, run:"
echo "    kubectl get pods,svc,pvc"
echo ""
echo "🌐 رابط المتجر الإلكتروني (Ecommerce URL): http://localhost:30000"
echo "🛠️ رابط phpMyAdmin (phpMyAdmin URL): http://localhost:30001"
echo "========================================"
