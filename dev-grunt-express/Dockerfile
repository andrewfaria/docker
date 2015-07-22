FROM dev-node

USER node
ENV HOME /home/node

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
