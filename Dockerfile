# Use an official PHP and Apache image as the parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the contents of your CodeIgniter application into the container
COPY ./application /var/www/html/application

# Copy the index.php file into the container
COPY ./index.php /var/www/html/index.php

# Copy the set_permissions.sh script into the container
COPY ./set_permissions.sh /set_permissions.sh

# Enable Apache Rewrite module for clean URLs (if needed)
RUN a2enmod rewrite

# Set proper file permissions for the script
RUN chmod +x /set_permissions.sh

# Set proper file permissions for the application
RUN chmod -R 755 /var/www/html/application
RUN chmod 755 /var/www/html/index.php

# Expose port 80 for HTTP
EXPOSE 80

# Start Apache when the container starts
CMD ["/set_permissions.sh"]
