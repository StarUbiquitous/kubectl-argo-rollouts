#!/bin/sh

set -e

if [ ! -d "$HOME/.kube" ]; then
    mkdir -p $HOME/.kube
fi

if [ ! -f "$HOME/.kube/config" ]; then
    if [ ! -z "${KUBE_CONFIG}" ]; then
        echo "$KUBE_CONFIG" | base64 -d > $HOME/.kube/config
    else
        echo "No authorization data found. Please provide KUBE_CONFIG variables. Exiting..."
        exit 1
    fi
fi

echo "/usr/local/bin/kubectl-argo-rollouts" >> $GITHUB_PATH

kubectl-argo-rollouts $*