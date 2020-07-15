FROM alpine

RUN apk --update --no-cache add docker su-exec

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN echo "*/5     *       *       *       *       run-parts /etc/periodic/5min" >> /etc/crontabs/root

COPY SendScheduleds /etc/periodic/5min/SendScheduleds
COPY parseReceivedSMS /etc/periodic/5min/parseReceivedSMS
RUN chmod +x /etc/periodic/5min/*

ENTRYPOINT  ["/entrypoint.sh"]
CMD [ "crond", "-f", "-L", "/dev/stdout" ]