# Étape 1 : Builder l'application
FROM node:20 AS builder

WORKDIR /app

# Copier les fichiers package.json et package-lock.json et installer les dépendances
COPY package.json package-lock.json ./
RUN npm install

# Copier tout le code source dans le conteneur
COPY . .

# Construire Next.js en mode production
RUN npm run build

# Étape 2 : Lancer l'application
FROM node:20 AS runner

WORKDIR /app

# Copier les fichiers du build
COPY --from=builder /app ./

# Exposer le port 3000
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "run", "start"]
