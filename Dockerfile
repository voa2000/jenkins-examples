FROM node:10.9.0

COPY . .

RUN npm install

EXPOSE 888

CMD npm start
