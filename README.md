# AYD_Tarea2_202100316

## crear el dockerfile 
El Dockerfile es el archivo que contiene instrucciones para construir la imagen de un contenedor. Define cómo debe configurarse el entorno en el que se ejecutará la aplicación, incluyendo la instalación de dependencias, la configuración del servidor y la ejecución de comandos.

```dockerfile
FROM node:16

# Paso 2: Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Paso 3: Copiar el archivo package.json y package-lock.json, en mi caso como dockerfile esta fuera de la carpeta fronted, se entra en la carpeta y se copia los archivos
COPY fronted/package*.json ./

# Paso 4: Instalar las dependencias de la aplicación
RUN npm install

# Copia el resto del código de la aplicación, de igual manera hay que acceder a la carpeta fronted 
COPY fronted ./

# Paso 6: Exponer el puerto que se pidio en enuciado 
EXPOSE 80  

# Comando para iniciar la aplicación
CMD ["npm", "run", "dev"]

```

## Docker compose 

El archivo docker-compose.yml permite definir y ejecutar aplicaciones multi-contenedor. En un entorno de desarrollo, generalmente, se utiliza para coordinar la construcción de la imagen y la ejecución del contenedor, así como la configuración de redes y volúmenes. 

```yaml
version: "3.8"

services:
  app:
    container_name: my-node-app
    build: .
    ports:
      - "80:80" 
    volumes:
      - /app/node_modules
    environment:
      - NODE_ENV=development
    command: npm run dev

```

## notas 
como hay que modificar el puerto se puede solo mapear el puerto y para que este se muestre en el 80, si se quieren mantener los mismos puertos en ambos es necesario configurar en vite.config.js, ademas de que hay que agregar host para que cuando se ejecuta una aplicación en un contenedor de Docker, por defecto solo escucha en localhost dentro del contenedor. El problema es que localhost dentro del contenedor no es el mismo que localhost que el de la pc, por lo que se agrega para que escuche en todas las interfaces de red disponibles tanto dentro del contenedor como desde la máquina host


```js
export default defineConfig({
  plugins: [react(),tailwindcss()],
  server: {
    port: 80,  // Cambia el puerto aquí
    host: '0.0.0.0',
  },
})

```