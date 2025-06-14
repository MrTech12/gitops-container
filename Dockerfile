FROM alpine:3.22.0

LABEL "org.opencontainers.image.title"="GitOps Container"
LABEL "org.opencontainers.image.source"="https://github.com/MrTech12/gitops-container"

COPY install-tools.sh ./install-tools.sh
COPY /configs /configs

RUN chmod +x ./install-tools.sh

RUN ./install-tools.sh