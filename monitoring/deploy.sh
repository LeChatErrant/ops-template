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

kubectl apply -f monitoring.namespace.yaml

bold
blue
echo "Deploying elasticsearch..."
normal
(
  cd elasticsearch
  ./deploy.sh
)
green
echo "Elasticsearch deployed !"
normal
