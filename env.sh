#!/bin/sh
# Be source to run this script with sourcing:  ". ./env.sh"

eval $(minikube docker-env)
echo 'This command prompt is now aware of Minikube.'
