Docker image for composer
=========================

## Simple usage

To run composer, do:

    docker run --rm --user $(id -u):$(id -g) -it --volume ${COMPOSER_JSON_LOCATION}:/var/www --volume /tmp/.composer-cache:/tmp/.composer nicodocker91/composer <composer-command>

## Volumes

The volumes availables to mount are `/var` and `/tmp/.composer`.
The first one is related to the workdir.
The second one is for the cache of composer.

> It is strongly encouraged to mount a local common volume dedicated to your composer cache, such as `/tmp/.composer-cache`.

The entrypoint is `/var/www`.

