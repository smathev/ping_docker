FROM alpine:latest

RUN apk add --update grep apk-cron speedtest-cli python bash && rm -rf /var/cache/apk/*
COPY crontab /crontab
COPY ping_script.sh /config/ping_script.sh
COPY speedtest.sh /config/speedtest.sh
COPY entry.sh /entry.sh
RUN chmod 755 /config/ping_script.sh /config/speedtest.sh /entry.sh
RUN /usr/bin/crontab /crontab

VOLUME /config

CMD ["/entry.sh"]
