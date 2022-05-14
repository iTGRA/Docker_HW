FROM node:12-alpine as build-stage
WORKDIR /app
COPY frontend/package*.json .
RUN npm install --only=prod
COPY frontend/ .
RUN npm run build


FROM nginx:latest as production-stage
COPY --from=build-stage /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
