#!/usr/bin/env bash

normal() {
  echo -en "\e[0m"
}

green() {
  echo -en "\e[32m"
}

kubectl apply -f studio.configmap.yaml
kubectl apply -f studio.secret.yaml
kubectl apply -f studio.deployment.yaml
kubectl apply -f studio.service.yaml
kubectl apply -f studio.ingress.yaml

green
echo "Studio exposed !"
normal
