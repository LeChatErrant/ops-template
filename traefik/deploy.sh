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

kubectl apply -f traefik.crd.yaml
kubectl apply -f traefik.rbac.yaml
kubectl apply -f traefik.daemonset.yaml
kubectl apply -f traefik.service.yaml

bold
blue
echo
echo -e "Adding HTTPS redirect middleware..."
normal
kubectl apply -f https
green
echo -e "Successfully added HTTPS redirect middleware !"
normal

bold
blue
echo
echo -e "Adding basic authentification middleware..."
yellow
echo -e "Warning : don't forget to change default credentials (admin:admin)"
normal
kubectl apply -f auth
green
echo -e "Successfully added basic authentification middleware !"
normal

bold
blue
echo
echo -e "Exposing Traefik dashboard..."
normal
kubectl apply -f dashboard
green
echo -e "Successfully exposed Traefik dashboard !"
normal