# debian:stretch-slim
FROM debian@sha256:c89506d37c80f9fd93489bc9b11a1453e62b791b5b7430e39b0b8baa69a40d80

# Configuration de la locale par défaut
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

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
        libgammu-i18n \
        locales && \
        sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
        locale-gen
COPY ./gammu/gammurc /etc/gammu
COPY ./gammu/gammu-smsdrc /etc/gammu-smsdrc

COPY ./raspisms/apache.conf /etc/apache2/sites-available/raspisms.conf
RUN a2ensite raspisms && \
    a2enmod rewrite

COPY ./raspisms /var/www/html/raspisms
RUN chmod +x /var/www/html/raspisms/console.php

WORKDIR /var/www/html/raspisms
CMD [ "apache2ctl", "-DFOREGROUND" ]
