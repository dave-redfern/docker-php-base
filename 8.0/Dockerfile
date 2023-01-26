#
# Dockerfile for a minimal PHP run time
#
# Bundles composer
#

FROM alpine:3.16
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /tmp

RUN apk --update add ca-certificates \
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
    php8 \
    php8-common \
    php8-bcmath \
    php8-bz2 \
    php8-calendar \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-fileinfo \
    php8-gettext \
    php8-iconv \
    php8-intl \
    php8-json \
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-pdo \
    php8-pdo_sqlite \
    php8-pecl-apcu \
    php8-pecl-igbinary \
    php8-pecl-redis \
    php8-phar \
    php8-session \
    php8-simplexml \
    php8-sockets \
    php8-sodium \
    php8-sqlite3 \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-xmlwriter \
    php8-xsl \
    php8-zip \
    php8-zlib \
	# Clean up
    && rm -rf /var/cache/apk/* /tmp/* \
    && php -v

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
