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
    php82 \
    php82-common \
    php82-bcmath \
    php82-bz2 \
    php82-calendar \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-fileinfo \
    php82-gettext \
    php82-iconv \
    php82-intl \
    php82-json \
    php82-mbstring \
    php82-opcache \
    php82-openssl \
    php82-pdo \
    php82-pdo_sqlite \
    php82-pecl-apcu \
    php82-pecl-igbinary \
    php82-pecl-redis \
    php82-phar \
    php82-session \
    php82-simplexml \
    php82-sockets \
    php82-sodium \
    php82-sqlite3 \
    php82-tokenizer \
    php82-xml \
    php82-xmlreader \
    php82-xmlwriter \
    php82-xsl \
    php82-zip \
    php82-zlib \
	# Clean up
    && rm -rf /var/cache/apk/* /tmp/* \
    && ln -sf /usr/bin/php82 /usr/bin/php && php -v

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
