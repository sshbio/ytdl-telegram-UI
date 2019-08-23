FROM node:alpine

RUN apk --no-cache add --virtual builds-deps python

WORKDIR "/app"

COPY ./package.json ./yarn.lock ./

RUN yarn install

COPY . .

CMD [ "node", "app.js" ]
