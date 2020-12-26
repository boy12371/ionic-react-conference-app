# pull official base image
FROM node:12.19.1

# set working directory
WORKDIR /opt/web

# add `./node_modules/.bin` to $PATH
ENV PATH ./node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN npm install --silent

# add working directory
COPY . ./

# build
RUN npm run build

# Stage 2 - the production environment
FROM nginx:latest
EXPOSE 80
WORKDIR /usr/share/nginx/html
COPY /opt/web/build/* /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
