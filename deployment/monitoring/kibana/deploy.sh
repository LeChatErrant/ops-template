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

blue() {
  echo -en "\e[34m"
}

kubectl apply -f kibana.configmap.yaml
kubectl apply -f kibana.deployment.yaml
kubectl apply -f kibana.service.yaml
kubectl apply -f kibana.ingress.yaml

green
echo "Kibana exposed !"
normal
