# Utiliza la imagen oficial de PostgreSQL como base
FROM postgres:latest

# Establece las variables de entorno para PostgreSQL
ENV POSTGRES_DB=gestor_documental
ENV POSTGRES_USER=postgres
# Cambiar por la contraseña deseada
ENV POSTGRES_PASSWORD=root 

# Copia los archivos SQL de inicialización a la carpeta de entrada del contenedor
COPY gestor_documental.sql /docker-entrypoint-initdb.d/

# Expone el puerto 5432 para permitir la comunicación con el servidor
EXPOSE 5432