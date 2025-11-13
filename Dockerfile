# Etapa 1: build con Vite
FROM node:20-alpine AS build

WORKDIR /app

# Solo los archivos necesarios para instalar deps
COPY package.json package-lock.json ./
RUN npm ci

# Copiar el resto del código
COPY . .

# Build de la app (genera /app/dist)
RUN npm run build

# Etapa 2: Nginx sirviendo los estáticos
FROM nginx:alpine

# Borrar el HTML por defecto (opcional, pero ayuda a detectar fallos)
RUN rm -rf /usr/share/nginx/html/*

# Copiar el build de Vite
COPY --from=build /app/dist/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
