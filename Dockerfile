FROM alpine:3.20.0

COPY install-tools.sh ./install-tools.sh
COPY /config /config

RUN chmod +x ./install-tools.sh

RUN ./install-tools.sh

LABEL "location.sources"="https://github.com/MrTech12/gitops-container"