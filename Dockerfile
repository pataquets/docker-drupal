FROM pataquets/apache-drupal

RUN \
	rm /var/www/index.html && \
	cd /var/www && \
	git clone --single-branch --branch 7.x http://git.drupal.org/project/drupal.git .

RUN chown -vR www-data:www-data \
	/var/www/sites/all \
	/var/www/sites/default
