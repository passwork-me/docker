FROM ubuntu:18.04
MAINTAINER fackyhigh@gmail.com

RUN apt-get update \
    && apt-get -y install nginx \
    && apt-get clean

RUN rm /etc/nginx/nginx.conf \
    && mkdir -p /server/conf/nginx/ \
    && touch /server/conf/nginx/nginx.conf \
    && touch /server/conf/nginx/prod.site \
    && ln -s /server/conf/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
