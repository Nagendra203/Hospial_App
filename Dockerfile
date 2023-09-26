# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables to prevent interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and install necessary packages
RUN apt-get update -y && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql

# Copy your PHP application files into the container
COPY ./application /var/www/html/

# Expose port 80 for Apache
EXPOSE 80

# Start Apache web server
CMD ["apachectl", "-D", "FOREGROUND"]
