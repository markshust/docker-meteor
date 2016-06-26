FROM node:0.10.45
MAINTAINER Mark Shust <mark@shust.com>

ADD . /opt/app

WORKDIR /opt/app

RUN (cd programs/server && npm i)

ENV PORT 80
EXPOSE 80

CMD ["node", "main.js"]
