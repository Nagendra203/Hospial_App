#!/bin/bash
# Set file permissions
chmod -R 755 /var/www/html/application
chmod -R 755 /var/www/html/system
chmod 755 /var/www/html/index.php
# Start Apache
exec "$@"
