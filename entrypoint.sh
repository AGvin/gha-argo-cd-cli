#!/bin/bash

set -e

ARGOCD_SERVER=$1
ARGOCD_TOKEN=$2
APP_NAME=$3
COMMAND=$4
ARGS=$5
GRPC_WEB=$6

# Log in to ArgoCD using the token
# argocd login $ARGOCD_SERVER --grpc-web --auth-token $ARGOCD_TOKEN --insecure

# setup GRPC_WEB_FLAG
if [ "$GRPC_WEB" == "true" ]; then
  GRPC_WEB_FLAG="--grpc-web"
else
  GRPC_WEB_FLAG=""
fi

# Construct the full command to run
FULL_COMMAND="argocd $COMMAND $APP_NAME $ARGS --server ${ARGOCD_SERVER} ${GRPC_WEB_FLAG} --auth-token ${ARGOCD_TOKEN}"

# Execute the constructed command
echo "Executing: $FULL_COMMAND"
eval $FULL_COMMAND
