# 1. Image de base
FROM node:20-alpine

# 2. Dossier de travail
WORKDIR /app

# 3. Copier les fichiers nécessaires
COPY package*.json ./

# 4. Installer les dépendances
RUN npm install

# 5. Copier le reste du projet
COPY . .

# 6. Générer Prisma Client
RUN npx prisma generate

# 7. Build si TypeScript
RUN npm run build

# 8. Port exposé (doit correspondre à ton app)
EXPOSE 3000

# 9. Commande de démarrage
CMD ["npm", "start"]
