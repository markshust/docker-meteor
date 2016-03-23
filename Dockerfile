FROM node:0.10.43
MAINTAINER Mark Shust <mark@shust.com>

ADD . /opt/app
WORKDIR /opt/app/programs/server

RUN npm install \
  && npm cache clear \
  && mv /opt/app/programs/server/node_modules /opt/

RUN mv /opt/app/package.json /opt

WORKDIR /opt
RUN npm install \
  && npm cache clear

RUN ln -s node_modules app/programs/server/node_modules \
  && ln -s node_modules app/programs/web.browser/node_modules \
  && ln -s node_modules app/programs/web.cordova/node_modules

WORKDIR /opt/app

ENV PORT 3000
EXPOSE 3000

CMD ["node", "main.js"]
