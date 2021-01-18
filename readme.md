# PHP Alpine Base Images

A set of PHP base images that use Alpine packages for easier setup / customisation.

This base provides:

 * 7.2 (Alpine 3.9)
 * 7.3 (Alpine 3.12)
 * 7.4 (Alpine 3.13)
 * 8.0 (Alpine 3.13)

## Intended Usage

Import from this image and add additional setup steps to build your app. For example:

```dockerfile
FROM somnambulist/php-base:7.4-latest

RUN apk --update add ca-certificates \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    php7-pdo-pgsql \
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
