# to build and run and two different phases, see below for different phases:

# create 'builder' phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# create 'runner' phase
FROM nginx
# copy folder created in the 'builder' phase created above to folder where it is served in nginx
COPY --from=builder /app/build /usr/share/nginx/html
