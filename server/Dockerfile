# 🔹 Stage 1 — Build
FROM node:18-alpine AS builder

WORKDIR /app

# Install required build tools (SAFE)
RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm install

COPY . .

# 🔹 Stage 2 — Production
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app /app

RUN npm prune --production

EXPOSE 3001

CMD ["node", "index.js"]