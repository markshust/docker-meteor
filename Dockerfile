FROM mhart/alpine-node:8.7
MAINTAINER Mark Shust <mark@shust.com>

RUN apk update && apk add \
  python \
  make \
  g++

ONBUILD ADD . /opt/app
ONBUILD RUN cd /opt/app/programs/server \
  && npm install

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
