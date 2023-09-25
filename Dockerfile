# Use an official PHP and Apache image as the parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the contents of your CodeIgniter application into the container
COPY ./application /var/www/html/application

# Enable Apache Rewrite module for clean URLs (if needed)
RUN a2enmod rewrite

# Set proper file permissions
RUN chmod -R 755 /var/www/html/application
RUN chmod 755 /var/www/html/index.php

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache when the container starts
CMD ["apache2-foreground"]
