FROM node:22

#create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install dependencies
COPY package.json .
RUN npm install -g npm
RUN npm install -g nodemon
RUN npm install
RUN npm install -D tailwindcss
RUN npx tailwindcss init
RUN echo 'You may have to stop the machine and destroy it (docker rm -f...) now.'

# Bundle app source
#COPY index.js ./

# Exports
EXPOSE 3000
CMD [ "npm", "run", "dev" ]
