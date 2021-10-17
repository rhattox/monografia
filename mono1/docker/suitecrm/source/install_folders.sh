#!/bin/bash

mkdir -p -m777  /var/www/html/upload/ /var/www/html/modules/ /var/www/html/cache/ /var/www/html/cache/images /var/www/html/cache/layout /var/www/html/cache/pdf /var/www/html/cache/xml /var/www/html/cache/include/javascript 

chown www-data:www-data -R /var/www/html/custom/ /var/www/html/upload/ /var/www/html/modules/ /var/www/html/cache/ /var/www/html/cache/images /var/www/html/cache/layout /var/www/html/cache/pdf /var/www/html/cache/xml /var/www/html/cache/include/javascript 

