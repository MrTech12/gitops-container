# GitOps-Container

## Overview
This project is for creating a Docker container, which provides access to popular GitOps CLI tools.

## Motivation
In the era of GitOps, developers have more customizability into the environments of their applications. This customizability is usually stored in files, which can be checked into version control and allow for peer-reviews. Then there are tools which spin up components, according to these files.
In order to make this setup work, different CLI tools have been created. A developer needs to install and put these tools on their machine to test, experiment and implement their infrastructure vision. The amount of them can become overwhelming and also requires upkeep to make use of the latest versions. The tools can also add and modify files on the machine, which could clash with other programs on the host. Another consequence is that a machine can become so full of these tools, that a developer might forget what purpose they serve.

Instead of putting the tools on a local machine, another option would be to use a Docker container. The container allows for a central place where are the tools are stored, where they can be easily managed and updated based on a Dockerfile or setup script. It also allows for the host machine to stay clean and only pack the essentials. A developer can use a container to run GitOps tools, without messing up or making changes to the host system.

## docker-compose
The GitHub project has the ability to push a new Docker image to [DockerHub](https://hub.docker.com/repository/docker/mrtech12/gitops-container), whenever the maintainer chooses (tool updates, extra configs, etc.).
One can write a docker command to pull and use the container that way. There is also a docker-compose file available, which allows for an easier setup process. The following commands can be sued to work with the compose file:
```yml
docker compose -f docker-compose.gitopscontainer.yml up -d # starting the container in the background
docker compose -f docker-compose.gitopscontainer.yml exec gitopscontainer sh # accessing the container
docker compose -f docker-compose.gitopscontainer.yml down # stopping and deleting the container

```

## Bundled tools
- curl
- nano
- tmux
- yq
- openssl
- kubectl
- helm
- ArgoCD CLI
- Argo Rollouts kubectl plugin
- Terraform CLI
- OpenTofu (fork of Terraform CLI)
- DigitalOcean CLI (doctl)
- Pulumi CLI
- Dapr CLI