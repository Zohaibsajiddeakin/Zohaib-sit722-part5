#!/bin/bash
# Delete deployments and services
kubectl delete deployment book-catalog-deployment
kubectl delete deployment inventory-management-deployment
kubectl delete service book-catalog-service
kubectl delete service inventory-management-service
