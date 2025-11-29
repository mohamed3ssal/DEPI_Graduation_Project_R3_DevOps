FROM node:18-alpine

WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy source code
COPY . .

# Default env (تقدر تعدلها من docker-compose)
ENV PORT=7000

EXPOSE 7000

CMD ["node", "app.js"]
