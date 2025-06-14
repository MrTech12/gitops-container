# GitOps-Container

## Overview
This project is for creating a Docker container, which provides access to popular GitOps CLI tools.

## Motivation
In the era of GitOps, developers have more customizability into the environments of their applications. This customizability is usually defined in files, which can be checked into version control and allow for peer-reviews. Then there are tools which spin up components, according to these files.
In order to make this setup work, different CLI tools have been created. A developer needs to install and put these tools on their machine to test, experiment and implement their infrastructure vision. The amount of tools can become overwhelming and also requires upkeep to make use of the latest versions. The tools can also add and modify files on the machine, which could clash with other programs on the host. Another consequence is that a developer might forget which or how many they have.

Instead of putting the tools on a local machine, another option would be to use a Docker container. The container allows for a central place for them, where they can be easily managed and updated based on a Dockerfile or setup script. It also allows for the host machine to stay clean and only pack the essentials. A developer can use a container to run GitOps tools, without messing up or making changes to the host system.

## docker-compose
The GitHub project has the ability to push a new Docker image to [DockerHub](https://hub.docker.com/repository/docker/mrtech12/gitops-container), whenever the maintainer chooses (tool updates, extra configs, etc.).
One can write a docker command to pull and use the container that way.

## Bundled tools
- [alpine](https://hub.docker.com/_/alpine/tags)
- curl
- nano (Custom config)
- tmux (Custom config)
- yq
- openssl
- kubectl
- [helm](https://github.com/helm/helm/releases)
- [ArgoCD CLI](https://github.com/argoproj/argo-cd/releases)
- [Argo Rollouts kubectl plugin](https://github.com/argoproj/argo-rollouts/releases)
- [Terraform CLI](https://releases.hashicorp.com/terraform)
- [OpenTofu (fork of Terraform CLI)](https://github.com/opentofu/opentofu/releases)
- [Pulumi CLI](https://www.pulumi.com/docs/iac/download-install/versions)
- [Dapr CLI](https://github.com/dapr/cli/releases)
- [Cilium CLI](https://github.com/cilium/cilium-cli/releases)
- [Hubble CLI](https://github.com/cilium/hubble/releases)
- [DigitalOcean CLI (doctl)](https://github.com/digitalocean/doctl/releases)
- [Hetzner CLI (hcloud)](https://github.com/hetznercloud/cli/releases)