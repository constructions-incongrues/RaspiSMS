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

COPY ./etc/docker/gammurc /etc/gammu
COPY ./etc/docker/gammu-smsdrc /etc/gammu-smsdrc

COPY ./etc/docker/apache.conf /etc/apache2/sites-available/raspisms.conf
RUN a2ensite raspisms && \
    a2enmod rewrite

COPY ./src /var/www/html/RaspiSMS
RUN chmod +x /var/www/html/RaspiSMS/console.php

WORKDIR /var/www/html/RaspiSMS
CMD [ "apache2ctl", "-DFOREGROUND" ]
