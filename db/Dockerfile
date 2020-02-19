FROM linuxserver/mariadb:arm32v7-latest

COPY ./raspisms/createDatabase.sql /config/initdb.d/00_raspisms_createDatabase.sql
COPY ./db/insertAdminUser.sql /config/initdb.d/10_raspisms_insertAdminUser.sql
COPY ./db/custom.cnf /config/custom.cnf
