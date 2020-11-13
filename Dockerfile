FROM php:7.4-apache
ENV TERM=xterm
LABEL maintainer="Pawel Cmachowski<pawel.cmachowski@gmail.com>" \
      version="wp-docker-starter--7.4"

# Install base requirements & sensible defaults + required PHP extensions
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        less \
        libpng-dev \
        libjpeg-dev \
        libxml2-dev \
        mariadb-client \
        sudo \
        vim \
        git \
        python-certbot-apache \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-jpeg=/usr \
    && docker-php-ext-install \
        exif \
        gd \
        mysqli \
        opcache \
        soap

RUN apt-get update \
    && apt-get install -y  libzip-dev zip unzip \
    && docker-php-ext-install zip

RUN echo 'memory_limit = 8000M' > /usr/local/etc/php/php.ini \
    && { \
        echo 'opcache.enable=1'; \
        echo 'opcache.revalidate_freq=0'; \
        echo 'opcache.memory_consumption=512'; \
        echo 'opcache.interned_strings_buffer=16'; \
        echo 'opcache.max_accelerated_files=10000'; \
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

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN sudo rm -rf /var/lib/apt/lists/* && apt-get update
RUN apt-get install rsync gnupg sshpass -y

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash \
    && apt-get install nodejs -yq \
    && npm install gulp -g \
    && npm install bower -g

RUN a2enmod ssl

WORKDIR /app
EXPOSE 80 443