#!/bin/sh
#set -ex

# This project was tested using Minikube v0.20.0 and K8s V1.7.0

# Start Minikube, you may want to adjust the cpu and memory resources to work with your target machine
minikube start --kubernetes-version v1.7.0 --cpus 4 --memory 8192

# See https://github.com/kubernetes/minikube/tree/master/deploy/addons
minikube addons enable heapster

minikube status
echo "$(minikube version) is now ready"
echo "Be sure to now run '. ./env.sh'"

# Troubleshooting:
# If Minikube does not start correctly, try `minikube delete`, then remove `~/.minikube/machines/.minikube` directory then run this script again.
