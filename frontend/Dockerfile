FROM node:16-alpine as builder
WORKDIR /app
COPY frontend /app
RUN npm install && npm run build

FROM nginx:1.23-alpine
COPY frontend/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist/ /usr/share/nginx/html/dist/momo-store/
EXPOSE 80