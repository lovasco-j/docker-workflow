FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
# Builds to ./app/build
RUN npm run build

# FROM starts another phase
FROM nginx
# use --from=Builder to specify that we would like to copy something from
# the previous build process
COPY --from=builder /app/build /usr/share/nginx/html
