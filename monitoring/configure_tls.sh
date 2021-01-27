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
echo "You are about to configure TLS for elasticsearch components"
normal

echo
echo "First of all, make sure the elasticsearch cluster is up"
read -p "Press enter when elasticsearch is ready"

espod=$(kubectl get pods -n monitoring | grep elasticsearch-statefulset | sed -n 1p | awk '{print $1}')

blue
bold
echo
echo "Generating CA (Certificate Authority) for your elasticsearch cluster..."
normal
yes "" | kubectl exec -it "$espod" -n monitoring -- bin/elasticsearch-certutil ca
green
echo "CA (Certificate Authority) successfully generated !"
normal
# Enter
# Enter

blue
bold
echo
echo "Generating certificate..."
normal
yes "" | kubectl exec -it "$espod" -n monitoring -- bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12
green
echo "Certificate successfully generated"
normal
# Enter
# Enter
# Enter

blue
echo
echo "Downloading certificate..."
normal
kubectl cp monitoring/"$espod":/usr/share/elasticsearch/elastic-certificates.p12 elastic-certificates.p12

blue
echo
echo "Creating kubernetes secret using certificate..."
normal
kubectl create secret generic elasticsearch-tls --from-file=elastic-certificates.p12 -n monitoring

blue
echo
echo "Configuring elasticsearch to use TLS"
normal
kubectl patch configmaps elasticsearch-configmap -n monitoring -p "$(cat elasticsearch/elasticsearch.configmap.patch-adding-tls.yaml)"

blue
echo
echo "Restarting elasticsearch"
normal
kubectl rollout restart statefulset -n monitoring elasticsearch-statefulset

green
echo
echo "TLS successfully configured !"
echo "Elasticsearch components are now restarting in order to take the new configuration into account"
bold
echo "Don't forget to save the generated certificate (monitoring/elastic-certificates.p12) in a safe place"
normal

read -p "Press enter to finish"


openssl pkcs12 -in filename.pfx -nocerts -out filename.key

openssl pkcs12 -in filename.pfx -clcerts -nokeys -out filename.crt