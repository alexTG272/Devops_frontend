
FROM node:18-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx:alpine


RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN touch /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/run/nginx.pid /var/cache/nginx /var/log/nginx /etc/nginx/conf.d


COPY --from=build-stage /app/dist /usr/share/nginx/html
USER appuser



EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]