# PHP Alpine Base Images

A set of PHP base images that use Alpine packages for easier setup / customisation.

This base provides:

 * 8.1 (Alpine 3.19)
 * 8.2 (Alpine 3.19)
 * 8.3 (Alpine 3.19)

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

If you require multiple locales be sure to add `icu-data-full` to the `apk add` list. This will increase the
size of your image.

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
