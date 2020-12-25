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
echo "Warning : Don't forget to change Redis default credentials (password : redispass)"
normal

kubectl apply -f redis.secret.yaml
kubectl apply -f redis.deployment.yaml
kubectl apply -f redis.service.yaml
