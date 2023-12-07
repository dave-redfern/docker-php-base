# PHP Base Image

An Alpine based container geared for extending for other usages. Contains:

 * composer

PHP is installed with:

 * curl
 * iconv, mbstring, gettext, intl
 * opcache, apcu & igbinary
 * xml & json libs
 * sqlite, pdo

Note:

 * only sqlite has been loaded, add MySQL / Postgres if you need them
 
In addition, the follow are available:

 * bash
 * curl
 * nano
 * tini
 * unzip
 * wget

Note:

If you need to install from custom git repos, be sure to setup git.
 
## Intended Usage

Import from this image and add additional setup steps to build your app. For example:

```dockerfile
FROM somnambulist/php-base:8.3-latest

RUN apk --update add ca-certificates \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    php83-pdo-pgsql \
    && rm -rf /var/cache/apk/* /tmp/*

RUN composer selfupdate
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
