FROM debian:bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb_init.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb_init.sh"]

#CMD ["mariadbd"]
