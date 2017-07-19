#!/bin/sh

export FISSION_URL=http://$(minikube ip):31313
export FISSION_ROUTER=$(minikube ip):31314
