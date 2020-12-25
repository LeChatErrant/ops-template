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

bold
blue
echo "Deploying full infrastructure..."
normal

bold
blue
echo
echo "Adding TLS certificates..."
normal
(
  cd tls
  ./deploy.sh
)
green
echo "Successfully added TLS certificates!"
normal

bold
blue
echo
echo "Adding ingress controller Traefik..."
normal
(
  cd traefik
  ./deploy.sh
)
green
echo "Successfully add ingress controller Traefik"
normal

bold
blue
echo
echo "Setup finished !"
normal
