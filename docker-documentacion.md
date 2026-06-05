# Documentación de Contenedores de Sistemas Gestores de Base de Datos

## Contenedor de Tutorial de Docker 
docker pull docker/getting-started

docker run -d -p 80:80 docker/getting-started

- -d detach (El proceso del contenedor se ejuecuta en background)
- -p (port, publish) (Mapea el puerto)
- docker/getting-started (Nombre de la imagen)

## Contenedor del DBMS MariaBD
docker pull mariadb

## Contenedor de MariaDB sin volumen 
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306 e0236 

# Contenedor de MariaDB con volumen 
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -v v-mariadbg2:/var/lib/mysql -p 3345:3306 e0236 

# Contenedor de Postgres con Volumen
docker run --name ServerPostgresG2 -e POSTGRES_PASSWORD=123456 \
-d -p 5457:5432 -v v-postgresg2:/var/lib/postgresql \
bfe50

# Contenedor de SQLServer 2022 con Volumen
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1452:1433 --name SQLServerG2 \
   -d -v v-sqlserverg2:/var/opt/mssql/data \
   db9a8



## Comandos Docker
| Comando | Descripción |
| :--- | :--- |
| docker pull nombre_imagen | **Descarga una imagen de DockerHub** [Docker Hub](https://hub.docker.com/) |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |
| docker ps | **Visualiza todos los contenedores que estan encendidos** |
| docker ps -a | **Visualiza todos los contenedores que están encedidos y apagados** |
| docker stop idcontenedor o nombrecontemedor | **Detiene un contenedor** |
| docker start idcontenedor o nombrecontemedor | **Enciende un contenedor** |
| docker rm idcontenedor o nombrecontemedor | **Elimina un contenedor si esta apagado** |
| docker rm -f idcontenedor o nombrecontemedor | **Elimina un contenedor este o no encendido** |





