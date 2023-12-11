FROM node:21-alpine

# Set working directory
WORKDIR /app

# Install production dependencies only 
COPY package*.json ./
RUN npm install --only=production

# Copy app
COPY . .

# Build and serve optimized app
RUN npm run build
CMD ["npm", "start"]

# Expose port
EXPOSE 8080
