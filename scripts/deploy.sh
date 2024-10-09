#!/bin/bash
# Apply Kubernetes deployment configurations
kubectl apply -f scripts/kubernetes/deployment.yaml
kubectl apply -f scripts/kubernetes/service.yaml
