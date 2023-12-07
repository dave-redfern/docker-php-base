#
# Dockerfile for a minimal PHP run time
#
# Bundles composer
#

FROM alpine:3.19
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp

RUN apk --update add ca-certificates \
    && echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    # Packages
    bash \
    curl \
    nano \
    openssl \
    tini \
    unzip \
    wget \
    php83 \
    php83-common \
    php83-bcmath \
    php83-bz2 \
    php83-calendar \
    php83-ctype \
    php83-curl \
    php83-dom \
    php83-fileinfo \
    php83-gettext \
    php83-iconv \
    php83-intl \
    php83-json \
    php83-mbstring \
    php83-opcache \
    php83-openssl \
    php83-pdo \
    php83-pdo_sqlite \
    php83-pecl-apcu \
    php83-pecl-igbinary \
    php83-pecl-redis \
    php83-phar \
    php83-session \
    php83-simplexml \
    php83-sockets \
    php83-sodium \
    php83-sqlite3 \
    php83-tokenizer \
    php83-xml \
    php83-xmlreader \
    php83-xmlwriter \
    php83-xsl \
    php83-zip \
    php83-zlib \
	# Clean up
    && rm -rf /var/cache/apk/* /tmp/* \
    && ln -s /usr/bin/php83 /usr/bin/php && php -v

# setup composer -- taken from the composer docker installer code
RUN curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://raw.githubusercontent.com/composer/getcomposer.org/cb19f2aa3aeaa2006c0cd69a7ef011eb31463067/web/installer \
 && php -r " \
    \$signature = '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5'; \
    \$hash = hash('sha384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
      unlink('/tmp/installer.php'); \
      echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
      exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer \
 && composer --ansi --version --no-interaction \
 && rm -f /tmp/installer.php

ENTRYPOINT ["/sbin/tini", "--"]
