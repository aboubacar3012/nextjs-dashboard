# Étape 1 : Builder l'application
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS builder

# Installer Node.js et les dépendances de build
RUN dnf install -y nodejs npm make gcc gcc-c++ python3

WORKDIR /app

# Copier package.json et installer les dépendances
COPY package.json package-lock.json ./
RUN npm install

# Copier tout le code source
COPY . .

# Construire l'application Next.js en mode production
RUN npm run build

# Étape 2 : Lancer l'application
FROM public.ecr.aws/amazonlinux/amazonlinux:2023 AS runner

# Installer Node.js et PM2
RUN dnf install -y nodejs npm

WORKDIR /app

# Copier le build depuis l’étape précédente
COPY --from=builder /app ./

# Exposer le port 3000
EXPOSE 3000

# Lancer l'application avec PM2
CMD ["npm", "run", "start"]

