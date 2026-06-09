#!/bin/bash

kubectl apply -f k8s/db-config.yml
kubectl apply -f k8s/nginx-config.yml
kubectl apply -f k8s/mysql-deployment.yml
kubectl apply -f k8s/ecom-deployment.yml
kubectl apply -f k8s/phpmyadmin-deployment.yml

