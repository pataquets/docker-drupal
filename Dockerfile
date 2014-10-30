FROM pataquets/apache-drupal

# Ubuntu Precise needs a newer 'git' package version.
# Add "Ubuntu git maintainers" PPA.
RUN DEBIAN_FRONTEND=noniteractive \
	echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu precise main" \
		| tee /etc/apt/sources.list.d/git.list && \
	apt-key adv --keyserver keyserver.ubuntu.com  --recv-keys E1DF1F24

RUN DEBIAN_FRONTEND=noniteractive \
	apt-get update && \
	apt-get install -y git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/

RUN \
	rm /var/www/index.html && \
	cd /var/www && \
	git clone --single-branch --branch 7.x http://git.drupal.org/project/drupal.git .

RUN chown -vR www-data:www-data \
	/var/www/sites/all \
	/var/www/sites/default
