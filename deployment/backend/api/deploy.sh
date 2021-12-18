#!/usr/bin/env bash

bold() {
  echo -en "\e[1m"
}

normal() {
  echo -en "\e[0m"
}

green() {
  echo -en "\e[32m"
}

yellow() {
  echo -en "\e[33m"
}

bold
yellow
echo "Warning : Don't forget to change API default secrets"
normal

kubectl apply -f api.configmap.yaml
kubectl apply -f api.secret.yaml
kubectl apply -f api.deployment.yaml
kubectl apply -f api.service.yaml
kubectl apply -f api.ingress.yaml

green
echo "API exposed !"
normal
