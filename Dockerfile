FROM jakzal/phpqa

ENV BUILD_DEPS="autoconf file g++ gcc libc-dev pkg-config re2c"

RUN apt-get update && apt-get install -y --no-install-recommends $BUILD_DEPS && rm -rf /var/lib/apt/lists/* \
	docker-php-ext-install sockets && \
	pecl install redis && \
	docker-php-ext-enable redis && \
	apt-get purge -y --auto-remove $BUILD_DEPS