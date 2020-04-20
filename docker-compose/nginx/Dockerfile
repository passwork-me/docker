FROM ubuntu:18.04
MAINTAINER fackyhigh@gmail.com

RUN apt-get update \
    && apt-get -y install nginx \
    && apt-get clean

RUN rm /etc/nginx/nginx.conf \
    && mkdir -p /server/conf/nginx/ \
    && touch /server/conf/nginx/nginx.conf \
    && touch /server/conf/nginx/prod.site \
    && ln -s /server/conf/nginx/nginx.conf /etc/nginx/nginx.conf \
    && rm /etc/nginx/sites-enabled/default

COPY permissions /server/permissions
COPY nginx-reload /server/nginx-reload

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
