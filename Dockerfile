FROM node:16

SHELL ["/bin/bash", "-c"]

WORKDIR /var/www/html

RUN apt-get update && \
    npm install -g npm 

ARG UID=1000
USER ${UID}

EXPOSE 3000
ENV HOST 0.0.0.0