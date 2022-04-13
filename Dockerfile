ARG TAG=latest
FROM jakzal/phpqa:$TAG

ENV BUILD_DEPS="autoconf file g++ gcc libc-dev pkg-config re2c"

RUN apt-get update && apt-get install -y --no-install-recommends $BUILD_DEPS && rm -rf /var/lib/apt/lists/* \
	docker-php-ext-install sockets && \
	pecl install redis apcu && \
	docker-php-ext-enable redis apcu && \
	apt-get purge -y --auto-remove $BUILD_DEPS
