# =========================================
# Stage 1: Build the React.js Application
# =========================================
ARG NODE_VERSION=22.14.0-alpine
ARG NGINX_VERSION=alpine3.21

# Use a lightweight Node.js image for building (customizable via ARG)
FROM node:${NODE_VERSION} AS development

# Set the working directory inside the container
WORKDIR /app

COPY package.json yarn.lock ./
COPY . .

EXPOSE 5173

# Install deps at runtime into the volume (keeps image small); then start dev server
CMD sh -c 'if [ ! -f node_modules/.yarn-integrity ]; then echo "Installing dependencies..."; yarn install; fi && exec yarn dev'

# ---------- Production Build Stage ----------
FROM node:${NODE_VERSION} AS build

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

RUN yarn build

# ---------- Production Serve Stage ----------
FROM nginx:${NGINX_VERSION} AS production

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
