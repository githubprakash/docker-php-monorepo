FROM php:7.2-fpm

RUN pecl install xdebug-2.6.0RC2 && docker-php-ext-enable xdebug 

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl  \
    libicu-dev 
    

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl 

# Install the PHP intl extension
RUN docker-php-ext-install intl