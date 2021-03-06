FROM php:7.1-fpm-alpine

MAINTAINER "Nicolas Giraud" <nicolas.giraud.dev@gmail.com>

# Set correct environment variables for composer.
ENV COMPOSER_VENDOR_DIR=vendor COMPOSER_CACHE_DIR=/tmp/.composer

# Install the latest version of composer.
RUN curl -Ls https://getcomposer.org/installer > /tmp/installer && \
    if [ "$(curl -Ls https://composer.github.io/installer.sig)" != $(php -r "echo hash_file('SHA384', '/tmp/installer');") ]; \
    then \
        >&2 echo 'ERROR: Invalid installer signature' \
        rm -rf /tmp/* \
        exit 1; \
    fi && \
    php /tmp/installer --no-ansi --install-dir=/usr/local/bin --filename=composer && \

    # Use the project hirak/prestissimo to run composer in parallel
    composer global require hirak/prestissimo && \
    rm -rf /var/lib/apt/lists/* /var/cache/apk/* /tmp/*

VOLUME ["/var/"]
WORKDIR /var/www

ENTRYPOINT ["composer"]
