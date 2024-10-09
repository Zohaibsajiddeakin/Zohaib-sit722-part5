#!/bin/bash
# Push Docker images to Azure Container Registry
az acr login --name eightpointtwoo
docker tag book_catalog:latest eightpointwoo/book_catalog:latest
docker tag inventory_management:latest eightpointwoo/inventory_management:latest
docker push eightpointwoo/book_catalog:latest
docker push eightpointwoo/inventory_management:latest
