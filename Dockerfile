# Étape 1 : Builder l'application
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS builder

# Installer Node.js et ses dépendances
RUN dnf install -y nodejs npm

# Installer make et gcc pour node-gyp
RUN dnf install -y make gcc

WORKDIR /app

# Copier package.json et installer les dépendances
COPY package.json package-lock.json ./
RUN npm install

# Copier le code source
COPY . .

# Construire l'application Next.js en mode production
RUN npm run build

# Étape 2 : Lancer l'application
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS runner

# Installer Node.js pour exécuter Next.js
RUN dnf install -y nodejs npm

WORKDIR /app

# Copier les fichiers du build
COPY --from=builder /app ./

# Exposer le port 3000
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "run", "start"]
