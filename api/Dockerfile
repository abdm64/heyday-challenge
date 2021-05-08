FROM node:12-alpine3.10

# Create app directory, this is in our container/in our image
WORKDIR /user/src/app

COPY package*.json ./

RUN npm install --only=production


COPY . .

RUN npm run build

EXPOSE 3000


CMD ["node", "dist/main"] 