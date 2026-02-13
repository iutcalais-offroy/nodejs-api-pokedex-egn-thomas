FROM node:20-alpine
WORKDIR /app

ENV DATABASE_URL 'postgresql://postgres:JPuOWQpFqwiRxBSnxNjjDEyzQwqwacpL@hopper.proxy.rlwy.net:42777/railway'

COPY package.json package-lock.json ./
RUN npm install -g npm@10
RUN npm install

COPY . .

RUN npx prisma generate
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
