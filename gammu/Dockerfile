# debian:stretch-slim
FROM debian@sha256:c89506d37c80f9fd93489bc9b11a1453e62b791b5b7430e39b0b8baa69a40d80

RUN apt-get update && \
    apt-get install -y \
        gammu \
        gammu-smsd \
        libgammu-i18n
COPY ./gammu/gammurc /etc/gammu
COPY ./gammu/gammu-smsdrc /etc/gammu-smsdrc

COPY ./raspisms/parseSMS.sh /usr/local/bin/parseSMS.sh
RUN chmod +x /usr/local/bin/parseSMS.sh

ENTRYPOINT [ "gammu-smsd" ]
WORKDIR /var/spool/gammu

HEALTHCHECK --start-period=60s --timeout=30s --interval=5s --retries=2 \
    CMD gammu-smsd-monitor -n1 -d1
