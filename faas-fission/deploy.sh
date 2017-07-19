#!/bin/sh

kubectl create -f https://github.com/fission/fission/releases/download/nightly20170705/fission-rbac.yaml
kubectl create -f https://github.com/fission/fission/releases/download/nightly20170705/fission-nodeport.yaml
