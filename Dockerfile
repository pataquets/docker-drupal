FROM pataquets/apache-drupal

WORKDIR /var/www

ONBUILD ADD drupal.make /var/www/drupal.make

ONBUILD RUN \
	rm /var/www/index.html && \
	cd /var/www && \
	drush make --no-cache drupal.make .

ONBUILD RUN \
	chown -vR www-data:www-data \
		/var/www/sites/all \
		/var/www/sites/default
