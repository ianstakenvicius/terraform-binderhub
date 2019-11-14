#!/bin/bash
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do sleep 10; done

cd /home/${admin_user}

#Persistent volume
kubectl create -f pv.yaml

# Certificate manager
sudo helm install stable/nginx-ingress --name quickstart
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
sudo helm repo add jetstack https://charts.jetstack.io
sudo helm repo update
sudo helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v0.11.0 \
  jetstack/cert-manager
kubectl create -f staging-binderhub-issuer.yaml
sleep 5m
kubectl get service quickstart

# Binderhub
sudo helm repo add jupyterhub https://jupyterhub.github.io/helm-chart
sudo helm repo update
sudo helm install jupyterhub/binderhub --version=${binder_version} \
  --name=binderhub --namespace=binderhub -f config.yaml -f secrets.yaml
sudo apt-get install git-crypt
