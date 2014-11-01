FROM pataquets/apache-drupal

WORKDIR /var/www

ONBUILD RUN \
	rm /var/www/index.html && \
	cd /var/www && \
	drush make drupal.make .

RUN chown -vR www-data:www-data \
	/var/www/sites/all \
	/var/www/sites/default
