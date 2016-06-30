FROM node:0.10.45
MAINTAINER Mark Shust <mark@shust.com>

ONBUILD ADD . /opt/app

WORKDIR /programs/server

ONBUILD RUN npm init -f && npm i

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
