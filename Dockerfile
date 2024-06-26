FROM node:22.0-alpine as Builder 

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . ./

RUN npm run build

FROM nginx

COPY --from=Builder /app/build /usr/share/nginx/html

