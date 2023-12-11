# Build stage
FROM node:21-alpine as build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . . 
RUN npm run build

# Production stage
FROM node:21-alpine  
WORKDIR /app
COPY --from=build /app/build .
EXPOSE 8080
CMD ["npm", "start"]
