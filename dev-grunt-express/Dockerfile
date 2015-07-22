# Grunt, Bower, Express, and Docker goodness
FROM ubuntu:14.04

MAINTAINER Andrew Faria <andrew@myimedia.com>

ENV LANG en_US.UTF-8
ENV HOME /home/node

RUN apt-get update && \
    apt-get -y install \
    curl \
    git \
    wget

RUN adduser --disabled-password --gecos "" node  \
  && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir /app
RUN chown -R node:node /app

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash - \
    && apt-get install -y nodejs

VOLUME /app
WORKDIR /app

USER node

RUN sudo npm install grunt-cli -g --verbose && \
    sudo npm install yo -g --verbose && \
    sudo npm install generator-express -g --verbose && \
    sudo npm install bower -g --verbose

EXPOSE 3000
EXPOSE 35729

VOLUME /app
WORKDIR /app

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
