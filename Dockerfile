FROM node:latest

RUN npm install
RUN mkdir /app
WORKDIR /app
COPY . /app

CMD npm run dev


