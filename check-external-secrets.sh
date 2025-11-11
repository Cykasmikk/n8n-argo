#!/bin/bash

echo "=== Step 1: Check if CRD exists ==="
kubectl get crd externalsecrets.external-secrets.io

echo -e "\n=== Step 2: Check API version available ==="
kubectl api-resources | grep -i externalsecret

echo -e "\n=== Step 3: Check CRD details (API versions) ==="
kubectl get crd externalsecrets.external-secrets.io -o jsonpath='{.spec.versions[*].name}' && echo

echo -e "\n=== Step 4: Check if operator is running ==="
kubectl get pods -n external-secrets

echo -e "\n=== Step 5: Check ClusterSecretStore CRD ==="
kubectl get crd clustersecretstores.external-secrets.io

echo -e "\n=== Step 6: Check if ClusterSecretStore exists ==="
kubectl get clustersecretstore azure-kv-store-dev

