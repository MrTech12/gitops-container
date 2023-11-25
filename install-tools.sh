#!/bin/sh

HELM_VERSION=3.13.2
ARGO_CD_VERSION=2.9.2
ARGO_ROLLOUTS_VERSION=1.6.2
TF_VERSION=1.6.4
DOCTL_VERSION=1.100.0
PULUMI_VERSION=3.94.2
DAPR_VERSION=1.12.0

printf "Message: Executing script to install GitOps tools \n\n"

## essential tools
printf "Message: Installing essential tools \n\n"
apk add --no-cache curl nano tmux yq openssl

printf "Message: Configuring nano & tmux \n\n"
touch ~/.nanorc
cat Config/nano-config.txt >> ~/.nanorc # Add custom nano config to user nanorc
touch ~/.tmux.conf
cat Config/tmux-config.txt >> ~/.tmux.conf # Add custom tmux config to user tmux.conff

## kubectl
printf "Message: Installing kubectl \n\n"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv ./kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl
export KUBE_EDITOR="nano"

## helm
printf "Message: Installing helm \n\n"
curl -LO https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz
tar -C /tmp/ -zxvf helm-v$HELM_VERSION-linux-amd64.tar.gz
rm helm-v$HELM_VERSION-linux-amd64.tar.gz
mv /tmp/linux-amd64/helm /usr/local/bin/helm
rm -r /tmp/linux-amd64
chmod +x /usr/local/bin/helm

## ArgoCD CLI
printf "Message: Installing ArgoCD CLI \n\n"
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v$ARGO_CD_VERSION/argocd-linux-amd64
mv argocd-linux-amd64 /usr/local/bin/argocd
chmod +x /usr/local/bin/argocd

## Argo Rollouts (kubectl plugin) [kubectl argo rollouts]
printf "Message: Installing Argo Rollouts kubectl plugin \n\n"
curl -LO https://github.com/argoproj/argo-rollouts/releases/download/v$ARGO_ROLLOUTS_VERSION/kubectl-argo-rollouts-linux-amd64
mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
chmod +x /usr/local/bin/kubectl-argo-rollouts

## Terraform CLI
printf "Message: Installing Terraform CLI \n\n"
curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
unzip /tmp/terraform.zip
mv terraform /usr/local/bin
rm -r /tmp/terraform.zip
chmod +x /usr/local/bin/terraform

## DigitalOcean CLI (doctl)
printf "Message: Installing DigitalOcean CLI (doctl) \n\n"
apk add --update --no-cache \
        ca-certificates \
        libc6-compat \
        openssh
curl -LO https://github.com/digitalocean/doctl/releases/download/v$DOCTL_VERSION/doctl-$DOCTL_VERSION-linux-amd64.tar.gz
tar -C /tmp/ -zxvf doctl-$DOCTL_VERSION-linux-amd64.tar.gz
rm doctl-$DOCTL_VERSION-linux-amd64.tar.gz
mv /tmp/doctl /usr/local/bin/doctl
chmod +x /usr/local/bin/doctl

## Pulumi
printf "Message: Installing Pulumi \n\n"
curl -LO https://get.pulumi.com/releases/sdk/pulumi-v$PULUMI_VERSION-linux-x64.tar.gz
tar -C /tmp/ -zxvf pulumi-v$PULUMI_VERSION-linux-x64.tar.gz
rm pulumi-v$PULUMI_VERSION-linux-x64.tar.gz
mv /tmp/pulumi/pulumi /usr/local/bin/pulumi
rm -r /tmp/pulumi
chmod +x /usr/local/bin/pulumi

## Dapr CLI
printf "Message: Installing Dapr CLI \n\n"
curl -LO https://github.com/dapr/cli/releases/download/v$DAPR_VERSION/dapr_linux_amd64.tar.gz
tar -C /tmp/ -zxvf dapr_linux_amd64.tar.gz
rm dapr_linux_amd64.tar.gz
mv /tmp/dapr /usr/local/bin/dapr
chmod +x /usr/local/bin/dapr