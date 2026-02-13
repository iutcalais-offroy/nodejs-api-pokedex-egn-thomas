FROM node:20-alpine
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install -g npm@10
RUN npm ci

COPY . .

RUN npx prisma generate
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
