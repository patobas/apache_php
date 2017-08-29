#############################################################
# Archivo Dockerfile para ejecutar contenedores en Memcached
# Basado en una imagen de Ubuntu
#############################################################

FROM ubuntu:12.04
MAINTAINER Pato CAI Bas <patobasalo@gmail.com>
VOLUME ["/opt/intra"]

RUN apt-get update && \
    apt-get install -y \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-ldap \
      php5-mysql \
      php5-pgsql

#Puerto
EXPOSE 8080

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

CMD ["/usr/local/bin/run"]

