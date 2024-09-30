#!/bin/bash

set -e

ARGOCD_SERVER=$1
ARGOCD_TOKEN=$2
APP_NAME=$3
COMMAND=$4
ARGS=$5

# Log in to ArgoCD using the token
# argocd login $ARGOCD_SERVER --grpc-web --auth-token $ARGOCD_TOKEN --insecure

# Construct the full command to run
if [ -n "$APP_NAME" ]; then
    # If the app_name is provided, include it in the command
    FULL_COMMAND="argocd $COMMAND $APP_NAME $ARGS --server ${ARGOCD_SERVER} --auth-token ${ARGOCD_TOKEN}"
else
    # If the app_name is not provided, run the command without it
    FULL_COMMAND="argocd $COMMAND $ARGS --server ${ARGOCD_SERVER} --auth-token ${ARGOCD_TOKEN}"
fi

# Execute the constructed command
echo "Executing: $FULL_COMMAND"
eval $FULL_COMMAND
