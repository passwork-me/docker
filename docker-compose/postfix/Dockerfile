FROM ubuntu:18.04
MAINTAINER fackyhigh@gmail.com

RUN apt-get update \
    && apt-get install -y postfix rsyslog ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/postfix \
    && rm -f /var/log/mail.log \
    && rm -f /var/log/syslog \
    && mkdir -p /server/conf/postfix \
    && ln -s /server/conf/postfix /etc/postfix \
    && ln -s /server/log/syslog/mail.log /var/log/mail.log \
    && ln -s /server/log/syslog/syslog /var/log/syslog

RUN cp /etc/resolv.conf /var/spool/postfix/etc/

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 25

CMD ["postfix", "start-fg"]
