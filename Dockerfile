FROM node:4.6
MAINTAINER Mark Shust <mark@shust.com>

RUN npm update -g --loglevel=silent

ONBUILD ADD . /opt/app

ONBUILD RUN cd /opt/app/programs/server \
  && ([ -f package.json ] || npm init -f) \
  && npm i --loglevel=silent --unsafe-perm

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
