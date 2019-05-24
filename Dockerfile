FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build has all important files we want for prod
 FROM nginx
 COPY --from=builder /app/build /usr/share/nginx/html

#Default nginx command is to start so do not need CMD