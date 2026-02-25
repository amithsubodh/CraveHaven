# Use official Node image
FROM node:18

# Create app directory inside container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy rest of backend code
COPY . .

# Expose backend port
EXPOSE 3001

# Start backend server
CMD ["node", "index.js"]
