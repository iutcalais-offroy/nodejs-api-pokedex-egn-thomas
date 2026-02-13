FROM node:20-alpine
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install -g npm@10
RUN npm install

COPY . .

ENV DATABASE_URL="postgresql://postgres:JPuOWQpFqwiRxBSnxNjjDEyzQwqwacpL@hopper.proxy.rlwy.net:42777/railway"

RUN npm run build

CMD ["npm", "run", "start"]
