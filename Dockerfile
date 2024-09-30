# Dockerfile

FROM alpine:latest

LABEL "maintainer"="Viacheslav Sapigura"
LABEL "repository"="https://github.com/AGvin/gha-argo-cd-cli"
LABEL "version"="0.0.0"

# Install necessary packages: curl, jq, and bash
RUN apk add --no-cache \
  curl \
  jq \
  bash

# Install ArgoCD CLI
RUN ARGOCD_VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | jq -r .tag_name) && \
    curl -sSL -o /usr/local/bin/argocd "https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64" && \
    chmod +x /usr/local/bin/argocd

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]