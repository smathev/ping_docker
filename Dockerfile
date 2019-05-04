FROM alpine:latest

RUN apk add --update grep apk-cron speedtest-cli python && rm -rf /var/cache/apk/*
ADD crontab /crontab
ADD ping_script.sh /config/ping_script.sh
ADD speedtest_output.sh /config/speedtest_output.sh
COPY entry.sh /entry.sh
RUN chmod 755 /config/ping_script.sh /config/speedtest_output.sh /entry.sh
RUN /usr/bin/crontab /crontab

VOLUME /config

CMD ["/entry.sh"]
