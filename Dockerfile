FROM node:0.10.45
MAINTAINER Mark Shust <mark@shust.com>

ADD . /opt/app

RUN mkdir -p /opt/apop/programs/server/node_modules \
  /opt/app/programs/web.browser/node_modules \
  /opt/app/programs/web.cordova/node_modules

WORKDIR /opt/app/programs/server
  
RUN npm install --production \
  && npm cache clear \
  && mv node_modules /opt/

RUN mv /opt/app/package.json /opt

WORKDIR /opt

RUN npm install --production \
  && npm cache clear

RUN ln -s node_modules app/programs/server/node_modules \
  && ln -s node_modules app/programs/web.browser/node_modules \
  && ln -s node_modules app/programs/web.cordova/node_modules

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
