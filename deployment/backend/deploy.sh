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
echo
echo "Deploying postgreSQL..."
normal
(
  cd postgres
  ./deploy.sh
)
green
echo "PostgreSQL deployed !"
normal

bold
blue
echo
echo "Deploying redis..."
normal
(
  cd redis
  ./deploy.sh
)
green
echo "Redis deployed !"
normal

bold
blue
echo
echo "Deploying API..."
normal
(
  cd api
  ./deploy.sh
)
green
echo "API deployed !"
normal

bold
blue
echo
echo "Deploying studio..."
normal
(
  cd studio
  ./deploy.sh
)
green
echo "Studio deployed !"
normal
