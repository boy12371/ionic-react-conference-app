# pull official base image
FROM node:12.19.1

# set working directory
RUN mkdir -p /opt/web
WORKDIR /opt/web

# install app dependencies
COPY package.json /opt/web/
RUN npm install --silent

# add working directory
COPY . /opt/web/

# build
RUN npm run build

EXPOSE 80
CMD ["npm", "run", "serve"]
