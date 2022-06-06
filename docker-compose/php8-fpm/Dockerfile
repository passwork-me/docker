FROM ubuntu:18.04
MAINTAINER support@passwork.me
WORKDIR /server

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y software-properties-common rsyslog pkg-config ssmtp git pkg-config libbson-1.0 libmongoc-1.0-0 php-pear \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get -y install -y php8.0-cli php8.0-fpm php8.0-common php8.0-curl php8.0-opcache php8.0-readline php8.0-dev php8.0-ldap php8.0-xml php8.0-bcmath php8.0-mbstring \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# pear

RUN apt-get update && \
    apt-get install -y php-pear

# zip

RUN apt-get update && \
    apt-get install -y zip unzip php8.0-zip

RUN pecl install mongodb \
    && echo "extension=mongodb.so" | tee /etc/php/8.0/fpm/conf.d/20-mongodb.ini \
    && echo "extension=mongodb.so" | tee /etc/php/8.0/cli/conf.d/20-mongodb.ini

RUN git clone -b v1.2.0 --depth=1 "https://github.com/jbboehr/php-psr.git" \
    && cd php-psr \
    && phpize \
    && ./configure \
    && make \
    && make test \
    && make install \
    && echo "extension=psr.so" | tee /etc/php/8.0/fpm/conf.d/20-psr.ini \
    && echo "extension=psr.so" | tee /etc/php/8.0/cli/conf.d/20-psr.ini \
    && cd -

RUN git clone -b v5.0.0beta3 --depth=1 "https://github.com/phalcon/cphalcon.git" \
    && cd cphalcon/build \
    && ./install \
    && echo "extension=phalcon.so" | tee /etc/php/8.0/fpm/conf.d/30-phalcon.ini \
    && echo "extension=phalcon.so" | tee /etc/php/8.0/cli/conf.d/30-phalcon.ini

RUN rm /etc/php/8.0/fpm/php.ini \
    && rm /etc/php/8.0/fpm/php-fpm.conf \
    && mkdir -p /server/conf/php8/ \
    && touch /server/conf/php8/php-fpm.conf \
    && touch /server/conf/php8/php.ini \
    && ln -s /server/conf/php8/php-fpm.conf /etc/php/8.0/fpm/php-fpm.conf \
    && ln -s /server/conf/php8/php.ini /etc/php/8.0/fpm/php.ini

RUN sed -i 's/mailhub=mail/mailhub=postfix/g' '/etc/ssmtp/ssmtp.conf' \
    && sed -i 's/#FromLineOverride=YES/FromLineOverride=YES/g' '/etc/ssmtp/ssmtp.conf'

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 9008

CMD ["php-fpm8.0", "--nodaemonize"]