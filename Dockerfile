# syntax=docker/dockerfile:experimental

FROM node:lts-alpine as build-stage

WORKDIR /app

COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn .yarn
COPY packages/app ./packages/app
COPY packages/components ./packages/components

RUN echo '!!! yarn install' && time yarn install && \
	echo '!!! yarn list' && time yarn workspaces list && \
	echo '!!! yarn list' && time yarn build && \
	echo '!!! cp app-build' && time cp -r packages/app/build app-build

FROM nginx:stable-alpine as deploy-stage
COPY packages/app/nginx.conf ./nginx.conf
WORKDIR /app
COPY --from=build-stage /app/app-build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;", "-c", "/nginx.conf"]
