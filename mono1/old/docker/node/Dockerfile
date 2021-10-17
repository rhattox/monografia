FROM node:16.6-alpine3.14

WORKDIR /home

COPY ./arquivos /home

RUN npm install 

RUN npm install express ejs reload morgan

EXPOSE 5000

CMD [ "node", "server.js" ]