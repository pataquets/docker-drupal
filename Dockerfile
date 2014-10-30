FROM pataquets/apache-drupal

RUN DEBIAN_FRONTEND=noniteractive \
	apt-get update && \
	apt-get install -y git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/

RUN \
	rm /var/www/index.html && \
	cd /var/www && \
	git clone --branch 7.x http://git.drupal.org/project/drupal.git .

RUN chown -vR www-data:www-data \
	/var/www/sites/all \
	/var/www/sites/default
