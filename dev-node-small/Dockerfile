# Small Node Dev Server with Grunt, Yo (express), Bower
# Alpine Linux, 5MB start
# 75% reduction in size compared to Ubuntu:14.04

FROM gliderlabs/alpine:3.2

MAINTAINER Andrew J. Faria <andrew@myimedia.com>

RUN apk --update add sudo \
    && adduser -s /bin/sh -g "" -S node \
    && passwd -u node \
    && echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER node

RUN sudo mkdir /app \
    && sudo chown -R node /app \
    && sudo apk --update add nodejs \
    && sudo npm update npm -g \
    && sudo npm install grunt-cli -g \
    && sudo npm install yo -g \
    && sudo npm install bower -g \
    && sudo npm install generator-express -g \
    && sudo find / -name '*gz' -type f -delete \
    && sudo rm -rf /tmp/*
    
EXPOSE 3000
EXPOSE 35729

VOLUME /app
WORKDIR /app

CMD ["grunt"]
