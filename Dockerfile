FROM alpine:latest

RUN apk add --update grep apk-cron speedtest-cli python && rm -rf /var/cache/apk/*
COPY crontab /crontab
COPY ping_script.sh /config/ping_script.sh
COPY speedtest_output.sh /config/speedtest_output.sh
COPY entry.sh /entry.sh
RUN chmod 755 /config/ping_script.sh /config/speedtest_output.sh /entry.sh
RUN /usr/bin/crontab /crontab

VOLUME /config

CMD ["/entry.sh"]
