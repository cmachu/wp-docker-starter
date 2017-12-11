FROM php:7.0-apache
ENV TERM=xterm
LABEL maintainer="Derek P Sifford <dereksifford@gmail.com>" \
      version="0.15.2-php7.0"

# Install base requirements & sensible defaults + required PHP extensions
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        less \
        libpng12-dev \
        libjpeg-dev \
        libxml2-dev \
        mariadb-client \
        unzip \
        sudo \
        vim \
        zip \
    && DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y \
        python-certbot-apache \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install \
        exif \
        gd \
        mysqli \
        opcache \
        soap \
        zip \
    # See https://secure.php.net/manual/en/opcache.installation.php
    && echo 'memory_limit = 512M' > /usr/local/etc/php/php.ini \
    && { \
        echo 'opcache.memory_consumption=128'; \
        echo 'opcache.interned_strings_buffer=8'; \
        echo 'opcache.max_accelerated_files=4000'; \
        echo 'opcache.revalidate_freq=2'; \
        echo 'opcache.fast_shutdown=1'; \
        echo 'opcache.enable_cli=1'; \
    } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Install wp-cli, configure apache, add scripts, create install directory & symlink
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf \
    && echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf && a2enconf fqdn \
    && a2enmod rewrite expires \
    && service apache2 restart \
    && mkdir -p /app ~/.wp-cli \
    && rm -fr /var/www/html \
    && ln -s /app /var/www/html


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && sudo mv wp-cli.phar /usr/local/bin/wp

WORKDIR /app
EXPOSE 80 443
