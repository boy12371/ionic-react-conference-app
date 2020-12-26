# pull official base image
FROM node:12.19.1

# set working directory
RUN mkdir -p /opt/web
WORKDIR /opt/web

# install app dependencies
COPY . /opt/web/

# build
RUN npm i
RUN npm run build

EXPOSE 8000
CMD ["npm", "run", "serve"]
