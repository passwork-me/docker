FROM ubuntu:18.04
MAINTAINER fackyhigh@gmail.com

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common rsyslog pkg-config ssmtp git \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get -y install -y php7.3-cli php7.3-fpm php7.3-common php7.3-curl php7.3-opcache php7.3-readline php7.3-json php7.3-dev php7.3-ldap php7.3-xml php7.3-bcmath php7.3-mbstring \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install mongodb \
    && echo "extension=mongodb.so" | tee /etc/php/7.3/fpm/conf.d/20-mongodb.ini

RUN git clone --branch 3.4.x  --depth=1 "git://github.com/phalcon/cphalcon.git" \
    && cd cphalcon/build \
    && ./install \
    && echo "extension=phalcon.so" | tee /etc/php/7.3/fpm/conf.d/20-phalcon.ini

RUN rm /etc/php/7.3/fpm/php.ini \
    && rm /etc/php/7.3/fpm/php-fpm.conf \
    && mkdir -p /server/conf/php/ \
    && touch /server/conf/php/php-fpm.conf \
    && touch /server/conf/php/php.ini \
    && ln -s /server/conf/php/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf \
    && ln -s /server/conf/php/php.ini /etc/php/7.3/fpm/php.ini

RUN sed -i 's/mailhub=mail/mailhub=postfix/g' '/etc/ssmtp/ssmtp.conf' \
    && sed -i 's/#FromLineOverride=YES/FromLineOverride=YES/g' '/etc/ssmtp/ssmtp.conf'

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 9000

CMD ["php-fpm7.3", "--nodaemonize"]

