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
    php81 \
    php81-common \
    php81-bcmath \
    php81-bz2 \
    php81-calendar \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-fileinfo \
    php81-gettext \
    php81-iconv \
    php81-intl \
    php81-json \
    php81-mbstring \
    php81-opcache \
    php81-openssl \
    php81-pdo \
    php81-pdo_sqlite \
    php81-pecl-apcu \
    php81-pecl-igbinary \
    php81-pecl-redis \
    php81-phar \
    php81-session \
    php81-simplexml \
    php81-sockets \
    php81-sodium \
    php81-sqlite3 \
    php81-tokenizer \
    php81-xml \
    php81-xmlreader \
    php81-xmlwriter \
    php81-xsl \
    php81-zip \
    php81-zlib \
	# Clean up
    && rm -rf /var/cache/apk/* /tmp/* \
    && ln -s /usr/bin/php81 /usr/bin/php && php -v

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
