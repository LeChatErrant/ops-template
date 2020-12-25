#!/usr/bin/env bash

bold() {
  echo -en "\e[1m"
}

normal() {
  echo -en "\e[0m"
}

yellow() {
  echo -en "\e[33m"
}

bold
yellow
echo "Warning : Don't forget to change database default credentials (root:dbpass)"
normal

kubectl apply -f postgres.configmap.yaml
kubectl apply -f postgres.secret.yaml
kubectl apply -f postgres.volume.yaml
kubectl apply -f postgres.deployment.yaml
kubectl apply -f postgres.service.yaml
