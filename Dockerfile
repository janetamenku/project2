FROM php:8.1-apache

# Copy the HTML, PHP, and CSS files into the web server directory
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Expose port 80 to be able to access the web server
EXPOSE 80

# Start Apache server
CMD ["apache2-foreground"]

# Install Composer
COPY composer.json composer.lock /var/www/html//

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-scripts --no-autoloader

# Install dependencies
RUN composer install --no-interaction --no-scripts