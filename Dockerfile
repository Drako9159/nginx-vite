FROM node:lts-bullseye as build
#configura una imagen como build
WORKDIR /app
#directorio de docker en el que se trabaja
COPY package*.json ./
#copia los archivos que empiezan con package y terminan con .json
RUN npm ci
#instala las dependencias especificadas en el package
COPY . .
#copia todos los archivos de la carpeta de trabajo
RUN npm run build
#compila el trabajo

### Stage 2
FROM nginx:alpine
ADD ./config/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /var/www/app/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 
