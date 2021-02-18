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
echo "Generating certificates..."
normal
yes "" | kubectl exec -it "$espod" -n monitoring -- bin/elasticsearch-certutil cert -pem
green
echo "Certificates successfully generated"
normal

blue
echo
echo "Downloading certificates..."
normal
kubectl cp monitoring/"$espod":/usr/share/elasticsearch/certificate-bundle.zip certificate-bundle.zip
unzip certificate-bundle.zip -d elastic-certificate-bundle
rm certificate-bundle.zip
mv elastic-certificate-bundle/instance/instance.crt elastic-certificate-bundle/instance/tls.crt
mv elastic-certificate-bundle/instance/instance.key elastic-certificate-bundle/instance/tls.key
green
bold
echo "Certificates successfully downloaded in monitoring/elastic-certificate-bundle !"
normal

blue
echo
echo "Creating kubernetes secret using certificate..."
normal
kubectl create secret generic elasticsearch-tls -n monitoring --from-file=elastic-certificate-bundle/ca/ca.crt --from-file=elastic-certificate-bundle/instance/tls.crt --from-file=elastic-certificate-bundle/instance/tls.key

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
echo "Don't forget to save the generated certificate (monitoring/elastic-certificate-bundle) in a safe place"
normal

read -p "Press enter to finish"