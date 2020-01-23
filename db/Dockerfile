FROM linuxserver/mariadb:arm32v7-latest

COPY ./raspisms/createDatabase.sql /config/initdb.d/00_createDatabase.sql
COPY ./db/insertAdminUser.sql /config/initdb.d/10_insertAdminUser.sql
