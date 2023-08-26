FROM alpine:3.18.3

COPY install-tools.sh ./install-tools.sh
COPY /Config /Config

RUN chmod +x ./install-tools.sh

RUN ./install-tools.sh