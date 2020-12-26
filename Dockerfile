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

EXPOSE 80
CMD ["npm", "run", "serve"]
