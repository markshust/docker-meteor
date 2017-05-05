FROM mhart/alpine-node:4.8
MAINTAINER Mark Shust <mark@shust.com>

RUN apk update \
  && apk add python make g++
RUN npm i -g yarn@0.23

ONBUILD ADD . /opt/app
ONBUILD RUN cd /opt/app/programs/server \
  && yarn
  && npm i bcrypt

WORKDIR /opt/app

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
