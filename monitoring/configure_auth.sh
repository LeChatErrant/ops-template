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
echo
echo "You are about to configure passwords for elasticsearch users"
normal

echo "First of all, make sure the elasticsearch cluster is up"
read -p "Press enter when elasticsearch is ready"

blue
echo
echo "In this template repository, stacks are configured to use some default credentials"
normal
echo -e "\tUser: elastic,beats_system,kibana_system,logstash_system,..."
echo -e "\tPassword: changeme"
echo "If you are simply trying things out, make sure to enter \"changeme\" as password for EVERY users"
echo "This way, everything will work directly"
yellow
bold
echo "If you are in production and wanna use a real password, do not use changeme"
echo "You will have to configure other stacks (kibana, logstash, beats...) to use your own credentials and restart them"
normal

echo
read -p "Press enter when ready"

kubectl exec -it $(kubectl get pods -n monitoring | grep elasticsearch-statefulset | sed -n 1p | awk '{print $1}') -n monitoring -- bin/elasticsearch-setup-passwords interactive

green
bold
echo
echo "Successfully configured authentification on elasticsearch !"
normal
yellow
echo "(Don't forget to save your credentials somewhere)"
normal

read -p "Press enter to finish"
