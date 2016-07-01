FROM node:0.10.45
MAINTAINER Mark Shust <mark@shust.com>

ONBUILD ADD . /opt/app

ONBUILD RUN cd /opt/app/programs/server \
  && ([ -f package.json ] || npm init -f) \
  && npm i

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
