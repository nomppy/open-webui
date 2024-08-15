######## WebUI frontend ########
FROM --platform=$BUILDPLATFORM node:21-alpine3.19 as build
ARG BUILD_HASH

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
ENV APP_BUILD_HASH=${BUILD_HASH}
EXPOSE 5173
CMD ["npm", "run", "dev"]

