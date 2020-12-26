# pull official base image
FROM node:12.19.1

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm i

# add app
COPY . ./

# start app
EXPOSE 8000
CMD ["npm", "run", "serve"]
