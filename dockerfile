# Usa una imagen oficial de Node.js
FROM node:18-alpine

# Establece el directorio de trabajo
WORKDIR /app

# Copia package.json y package-lock.json
COPY fronted/package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto del código de la aplicación
COPY fronted ./

# Expone el puerto en el que corre la app
EXPOSE 80

# Comando para correr la aplicación (ajusta según el framework usado)
CMD ["npm", "run", "dev"]
