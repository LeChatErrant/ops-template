#!/usr/bin/env bash

bold() {
  echo -e "\e[1m"
}

normal() {
  echo -e "\e[0m"
}

if [ ! -f "true.tls.secret.yaml" ]
then
  bold
  echo "Warning : default tls certificate added. Consider adding yours in 'tls/true.tls.secret.yaml'"
  normal
  kubectl apply -f tls.secret.yaml
else
  kubectl apply -f true.tls.secret.yaml
fi
