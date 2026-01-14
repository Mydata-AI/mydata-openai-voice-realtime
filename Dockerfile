# -------- Base image --------
FROM node:20-slim

# Create app directory
WORKDIR /app

# Install dependencies first (better cache)
COPY package*.json ./
RUN npm install --omit=dev

# Copy app source
COPY . .

# Fly expects the app to listen on $PORT
ENV NODE_ENV=production

# Expose port (Fly uses this internally)
EXPOSE 8080

# Start app
CMD ["node", "index.js"]
