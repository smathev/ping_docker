FROM alpine:latest

RUN apk add --update grep apk-cron && rm -rf /var/cache/apk/*
ADD crontab /crontab
ADD ping_script.sh /ping_script.sh
COPY entry.sh /entry.sh
RUN chmod 755 /ping_script.sh /entry.sh
RUN /usr/bin/crontab /crontab

VOLUME /config

CMD ["/entry.sh"]
