# Stage 1: Build the application
FROM node:16.17.0-alpine as builder
WORKDIR /app
COPY ./package.json .
COPY ./yarn.lock .
# Package Manager
RUN yarn install
COPY . .
# ARG TMDB_V3_API_KEY   # Movie Database API Key passed as an argument while building the image
# ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}   # Use for building the application if .env file is not present
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"
RUN yarn build


# Stage 2: Create the production image
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
# Copy the contents of dist directory
COPY --from=builder /app/dist .
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]