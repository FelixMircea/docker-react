FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#"builder"=tag from first step
#build from first step is located under "/app build"
#we copy the "/app/build" content under "/usr/share/nginx/html" to run it automatically
COPY --from=builder /app/build /usr/share/nginx/html

