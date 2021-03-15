#!/bin/sh

sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories

apk add --no-cache autoconf g++ libtool make curl-dev libxml2-dev linux-headers

#echo "---------- Install mcrypt ----------"
#apk add --no-cache libmcrypt-dev
#docker-php-ext-install mcrypt

echo "---------- Install pdo_mysql ----------"
docker-php-ext-install -j 2 pdo_mysql

echo "---------- Install zip ----------"
docker-php-ext-install -j 2 zip

echo "---------- Install pcntl ----------"
docker-php-ext-install -j 2 pcntl


echo "---------- Install mysqli ----------"
docker-php-ext-install -j 2 mysqli


echo "---------- Install mbstring ----------"
docker-php-ext-install -j 2 mbstring

echo "---------- Install exif ----------"
docker-php-ext-install -j 2 exif

echo "---------- Install calendar ----------"
docker-php-ext-install -j 2 calendar

echo "---------- Install sockets ----------"
docker-php-ext-install -j 2 sockets

echo "---------- Install gettext ----------"
apk add --no-cache gettext-dev
docker-php-ext-install -j 2 gettext

echo "---------- Install shmop ----------"
docker-php-ext-install -j 2 shmop

echo "---------- Install bz2 ----------"
apk add --no-cache bzip2-dev
docker-php-ext-install -j 2 bz2

echo "---------- Install xsl ----------"
apk add --no-cache libxslt-dev
docker-php-ext-install -j 2 xsl

echo "---------- Install wddx ----------"
apk add --no-cache libxslt-dev
docker-php-ext-install -j 2 wddx

echo "---------- Install curl ----------"
docker-php-ext-install -j 2 curl

#echo "---------- Install mysql ----------"
#docker-php-ext-install -j 2 mysql

echo "---------- Install wddx ----------"
docker-php-ext-install -j 2 wddx

echo "---------- Install readline ----------"
apk add --no-cache readline-dev
apk add --no-cache libedit-dev
docker-php-ext-install -j 2 readline

echo "---------- Install gmp ----------"
apk add --no-cache gmp-dev
docker-php-ext-install -j 2 gmp

echo "---------- Install ldap ----------"
apk add --no-cache ldb-dev
apk add --no-cache openldap-dev
docker-php-ext-install -j 2 ldap

echo "---------- Install redis ----------"
curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/4.0.1.tar.gz \
&& tar xfz /tmp/redis.tar.gz -C  /usr/src/php/ext/ \
&& mv /usr/src/php/ext/phpredis-4.0.1 /usr/src/php/ext/redis \
&& rm -r /tmp/redis.tar.gz \
&& docker-php-ext-install redis

#echo "---------- Install gd ----------"
#docker-php-ext-install gd


echo "---------- Install bcmath ----------"
docker-php-ext-install bcmath


echo "---------- Install ctype ----------"
docker-php-ext-install ctype


echo "---------- Install fileinfo ----------"
docker-php-ext-install fileinfo


echo "---------- Install mbstring ----------"
docker-php-ext-install mbstring


echo "---------- Install openssl ----------"
docker-php-ext-install openssl


echo "---------- Install pdo ----------"
docker-php-ext-install pdo


echo "---------- Install tokenizer ----------"
docker-php-ext-install tokenizer


echo "---------- Install XML ----------"
docker-php-ext-install xml


echo "---------- Install xdebug ----------"
wget http://xdebug.org/files/xdebug-2.9.8.tgz -O /usr/src/php/ext/xdebug.tgz \
&& tar -xzvf /usr/src/php/ext/xdebug.tgz -C /usr/src/php/ext/ && rm /usr/src/php/ext/package.xml && rm /usr/src/php/ext/xdebug.tgz \
&& mv /usr/src/php/ext/xdebug-2.9.8 /usr/src/php/ext/xdebug \
&& docker-php-ext-install xdebug


echo "---------- Install soap  ----------"
apk add --no-cache php-soap
docker-php-ext-install soap

echo "---------- Install pcre ----------"
docker-php-ext-install  pcre

echo "---------- Install opcache ----------"
docker-php-ext-install  opcache
echo "---------- Install intl ----------"
#apk add icu-dev apt-get install libicu-dev
apk add icu-dev \
&& docker-php-ext-install  intl


#apk add --no-cache freetype-dev libjpeg-turbo-dev libpng-dev \
#&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#&& docker-php-ext-install -j 2 gd
#apk add libpng-dev freetype-dev libjpeg-turbo-dev \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/  \
#    && docker-php-ext-install -j$(nproc) gd
#echo "---------- Install mhash ----------"
#mkdir mhash \
#&& tar -xf mhash-0.9.9.9.tar.gz -C mhash --strip-components=1 \
#&& ( cd mhash  && ./configure && make && make install )\
#&& docker-php-source extract \
#&& ( cd /usr/src/php && ./configure --with-mcrypt --with-mhash=/usr/local/include && make && make install )
# && docker-php-source delete