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
COPY --from=build-deps /opt/web/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
