#!/bin/sh
set -v

kubectl create -f shiny.yml 
kubectl create -f shiny-service.yml