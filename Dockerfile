# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to non-interactive mode during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies and PHP
RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php \
    php-cli \
    libapache2-mod-php \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure Apache to run in the foreground
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && echo "ServerSignature Off" >> /etc/apache2/apache2.conf \
    && echo "ServerTokens Prod" >> /etc/apache2/apache2.conf

# Expose port 80 for HTTP
EXPOSE 80

# Create a directory for your PHP application code
WORKDIR /var/www/html

# Copy your PHP application code into the container
COPY ./application /var/www/html

# Start Apache when the container starts
CMD ["apachectl", "-D", "FOREGROUND"]
