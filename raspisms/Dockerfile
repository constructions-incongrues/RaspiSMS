FROM arm32v7/debian:stretch

EXPOSE 80

RUN apt-get update && \
    apt-get install -y \
        apache2 \
        libapache2-mod-php7.0 \
        php7.0 \
        php7.0-cli \
        php7.0-json \
        php7.0-mbstring \
        php7.0-mysql \
        php7.0-opcache \
        php7.0-readline \
        gammu \
        gammu-smsd \
        libgammu-i18n

COPY ./gammu/gammurc /etc/gammu
COPY ./gammu/gammu-smsdrc /etc/gammu-smsdrc

COPY ./raspisms/apache.conf /etc/apache2/sites-available/raspisms.conf
RUN a2ensite raspisms && \
    a2enmod rewrite

# RUN sed -i s#/var/www/html#/var/www/html/raspisms# /etc/apache2/sites-available/000-default.conf && \
#     sed -i s#/var/www/html#/var/www/html/raspisms# /etc/apache2/sites-available/default-ssl.conf

COPY ./raspisms /var/www/html/raspisms
RUN chmod +x /var/www/html/raspisms/console.php

WORKDIR /var/www/html/raspisms
CMD [ "apache2ctl", "-DFOREGROUND" ]
