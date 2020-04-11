FROM ubuntu:18.04
MAINTAINER fackyhigh@gmail.com

RUN apt-get update \
    && apt-get install -y gnupg2 ca-certificates \
    && apt-get clean

#RUN rm /etc/nginx/nginx.conf \
#    && mkdir -p /server/conf/nginx/ \
#    && touch /server/conf/nginx/nginx.conf \
#    && touch /server/conf/nginx/prod.site \
#    && ln -s /server/conf/nginx/nginx.conf /etc/nginx/nginx.conf

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B \
    && echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb.list \
    && apt-get update \
    && apt-get install -y mongodb-org

EXPOSE 27017

CMD ["mongod", "--config", "/server/conf/mongod.conf"]
