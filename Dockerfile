FROM node:18-alpine AS build

WORKDIR /usr/src/app

RUN npm install -g yarn

RUN npm install -g @nestjs/cli

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# FROM node:18-alpine AS production

# WORKDIR /usr/src/app

# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}

# COPY --from=build /usr/src/app/dist ./dist

# RUN npm install --only=production

# RUN rm package*.json

# EXPOSE 8080

# CMD ["node", "dist/main.js"]
CMD ["npm", "run", "start:dev"]

