FROM alpine:3.12

COPY scripts/ /app/scripts/
RUN cd /app \
  && apk add --no-cache \
    composer \
    php7 \
    php7-xml \
  && composer require --no-cache --optimize-autoloader \
    phpmd/phpmd \
#    phpunit/phpunit \
#    squizlabs/php_codesniffer \
  && chmod a+x /app/scripts/*

WORKDIR /app
ENV PATH=/app/vendor/bin:/app/scripts:$PATH
CMD ["phpmd", "--help"]
