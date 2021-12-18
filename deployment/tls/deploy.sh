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

if [ ! -f "true.tls.secret.yaml" ]
then
  bold
  yellow
  echo "Warning : default tls certificate added. Consider adding yours in 'tls/true.tls.secret.yaml'"
  normal
  kubectl apply -f tls.secret.yaml
else
  kubectl apply -f true.tls.secret.yaml
fi
