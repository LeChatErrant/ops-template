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

if [ ! -f "true.registry.secret.yaml" ]
then
  bold
  yellow
  echo "Warning : default registry credentials added. Consider adding yours in 'registry/true.registry.secret.yaml'"
  normal
  kubectl apply -f registry.secret.yaml
else
  kubectl apply -f true.registry.secret.yaml
fi
