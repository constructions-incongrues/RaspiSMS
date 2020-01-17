FROM arm32v7/debian:stretch

RUN apt-get update && \
    apt-get install -y \
        gammu \
        gammu-smsd \
        libgammu-i18n
COPY ./etc/docker/gammurc /etc/gammu
COPY ./etc/docker/gammu-smsdrc /etc/gammu-smsdrc
COPY ./src/parseSMS.sh /usr/local/bin/parseSMS.sh
RUN chmod +x /usr/local/bin/parseSMS.sh

ENTRYPOINT [ "gammu-smsd" ]
WORKDIR /var/spool/gammu
