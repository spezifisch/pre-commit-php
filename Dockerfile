FROM alpine:3.12

WORKDIR /app

RUN apk add --no-cache \
    bash \
    composer \
    php7 \
    php7-dom \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-xmlwriter \
  && composer require --no-cache --optimize-autoloader \
    friendsofphp/php-cs-fixer \
    phpmd/phpmd \
    phpstan/phpstan \
    phpunit/phpunit \
    squizlabs/php_codesniffer \
  && rm -rf /root/.composer \
  && wget -qO /usr/local/bin/phpcpd https://phar.phpunit.de/phpcpd.phar \
  && chmod a+x /usr/local/bin/phpcpd

COPY pre-commit-hooks/ /app/pre-commit-hooks/
RUN chmod a+x /app/pre-commit-hooks/*
ENV PATH=/app/vendor/bin:/app/pre-commit-hooks:$PATH

CMD ["phpunit"]
