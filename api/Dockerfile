FROM node:alpine

# Create app directory, this is in our container/in our image
WORKDIR /user/src/app


COPY package*.json ./


RUN npm install --only=production


# Bundle app source
COPY . .

RUN npm run build

EXPOSE 3000


CMD [ "node", "dist/main" ]