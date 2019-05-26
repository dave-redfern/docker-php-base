# PHP Base Image

An Alpine 3.9 based container geared for extending for other usages. Contains:

 * composer

PHP is installed with:

 * igbinary
 * opcache / apcu
 * xml libs
 * curl
 * iconv, mbstring, gettext, intl
 
And a few others.

Note:

 * only sqlite has been loaded, add MySQL / Postgres if you need them
 
## Intended Usage

Import from this image and add additional setup steps to build your app. For example:

```dockerfile
FROM somnambulist/php-base:latest

RUN apk --update add ca-certificates \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    php7-pdo-pgsql \
    && rm -rf /var/cache/apk/* /tmp/*

```

A `.dockerignore` should be setup to prevent copying in git and vendor files:

```
.idea
*.md
.git
.dockerignore
node_modules
vendor
var
docker-compose*
```
