FROM alpine:3.18.3

COPY install-tools.sh ./install-tools.sh
COPY /Config /Config

RUN ./install-tools.sh