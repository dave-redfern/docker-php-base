#
# Dockerfile for a minimal PHP run time
#
# Bundles composer
#

FROM alpine:3.9
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp

RUN apk --update add ca-certificates \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    # Packages
    bash \
    curl \
    openssl \
    tini \
    unzip \
    wget \
    php7 \
    php7-common \
    php7-bcmath \
    php7-bz2 \
    php7-calendar \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-gettext \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_sqlite \
    php7-pecl-apcu \
    php7-pecl-igbinary \
    php7-pecl-redis \
    php7-phar \
    php7-session \
    php7-simplexml \
    php7-sodium \
    php7-sqlite3 \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-xsl \
    php7-zip \
    php7-zlib \
	# Clean up
    && rm -rf /var/cache/apk/* /tmp/*

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
