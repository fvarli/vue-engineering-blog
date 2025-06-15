# 1. Use lightweight base image
FROM node:20-slim

# 2. Set working directory
WORKDIR /app

# 3. Copy only package files and install deps
COPY package*.json ./

# 4. Install dependencies cleanly inside container
RUN npm install --frozen-lockfile && npm rebuild

# 5. Copy rest of the source code
COPY . .

# 6. Build Nuxt inside container (do not rely on host build!)
RUN npm run build

# 7. Expose Nuxt port
EXPOSE 3000

# 8. Start Nuxt server
CMD ["npm", "run", "start"]
