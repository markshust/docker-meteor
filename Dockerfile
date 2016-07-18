FROM node:4.4.7-wheezy
MAINTAINER Mark Shust <mark@shust.com>

RUN npm update -g

ONBUILD ADD . /opt/app

ONBUILD RUN cd /opt/app/programs/server \
  && ([ -f package.json ] || npm init -f) \
  && npm i

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
