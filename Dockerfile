# pull official base image
FROM node:12.18.1 AS builder

# set working directory
WORKDIR /opt/web

# add `./node_modules/.bin` to $PATH
ENV PATH ./node_modules/.bin:$PATH

# install app dependencies
COPY package.json package-lock.json ./
RUN npm install --silent

# add working directory
COPY . ./

# build app
CMD ["npm", "start"]
