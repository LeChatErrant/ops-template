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

kubectl apply -f elasticsearch.rbac.yaml
kubectl apply -f elasticsearch.configmap.yaml
kubectl apply -f elasticsearch.statefulset.yaml
kubectl apply -f elasticsearch.service.yaml
kubectl apply -f elasticsearch.headless-service.yaml
