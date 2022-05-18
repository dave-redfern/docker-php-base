# PHP Alpine Base Images

A set of PHP base images that use Alpine packages for easier setup / customisation.

This base provides:

 * 7.4 (Alpine 3.15)
 * 8.0 (Alpine 3.15)
 * 8.1 (Alpine Edge + Community)

## Intended Usage

Import from this image and add additional setup steps to build your app. For example:

```dockerfile
FROM somnambulist/php-base:8.0-latest

RUN apk --update add ca-certificates \
    && apk update \
    && apk upgrade \
    && apk --no-cache add -U \
    php8-pdo-pgsql \
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
