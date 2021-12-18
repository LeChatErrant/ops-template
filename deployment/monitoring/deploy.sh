#!/usr/bin/env bash

bold() {
  echo -en "\e[1m"
}

normal() {
  echo -en "\e[0m"
}

red() {
  echo -en "\e[31m"
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
echo
echo "Deploying elasticsearch..."
normal
(
  cd elasticsearch
  ./deploy.sh
)
green
echo "Elasticsearch deployed !"
normal

bold
blue
echo
echo "Deploying logstash..."
normal
(
  cd logstash
  ./deploy.sh
)
green
echo "Logstash deployed !"
normal

bold
blue
echo
echo "Deploying filebeat..."
normal
(
  cd filebeat
  ./deploy.sh
)
green
echo "Filebeat deployed !"
normal

bold
blue
echo
echo "Deploying heartbeat..."
normal
(
  cd heartbeat
  ./deploy.sh
)
green
echo "Heartbeat deployed !"
normal

bold
blue
echo
echo "Deploying kibana..."
normal
(
  cd kibana
  ./deploy.sh
)
green
echo "Kibana deployed !"
normal

red
bold
echo
echo "IMPORTANT : Do not forget to configure elasticsearch authentification"
echo "This can be done using script monitoring/configure_auth.sh"
normal
