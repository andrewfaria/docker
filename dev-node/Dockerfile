FROM ubuntu:14.04

RUN apt-get update && \
    apt-get -y install \
    curl \
    git \
    wget

RUN adduser --disabled-password --gecos "" node  \
  && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /app
RUN chown -R node:node /app

ENV HOME /home/node
ENV LANG en_US.UTF-8

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - \
    && apt-get install -y nodejs

VOLUME /app
WORKDIR /app

USER node
