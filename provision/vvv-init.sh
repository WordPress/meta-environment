#!/bin/bash

###
echo "Provisioning wordcamp.dev"
###

CURRENT_SITE="/srv/www/wordcamp.dev"
cd $CURRENT_SITE

if [ ! -d $CURRENT_SITE ]; then
	# Setup WordPress and the WordCamp.org source code
	wp core download --path=$CURRENT_SITE/wordpress
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/ $CURRENT_SITE/wp-content
	mkdir $CURRENT_SITE/wp-content/mu-plugins
	cp /vagrant/config/wordpress-config/wordcamp.dev/wp-config.php $CURRENT_SITE
	cp /vagrant/config/wordpress-config/wordcamp.dev/sandbox-functionality.php $CURRENT_SITE/wp-content/mu-plugins/

	# Install 3rd-party plugins
	PLUGINS=( akismet buddypress bbpress camptix camptix-network-tools camptix-pagseguro camptix-payfast-gateway core-control debug-bar debug-bar-console debug-bar-cron email-post-changes jetpack tagregator wp-multibyte-patch wordpress-importer )
	for i in "${PLUGINS[@]}"
	do :
	   wp plugin install $i --path=$CURRENT_SITE/wordpress
	done

else
	svn up
	wp core   update --path=$CURRENT_SITE/wordpress
	wp plugin update --all --path=$CURRENT_SITE/wordpress
	wp theme  update --all --path=$CURRENT_SITE/wordpress

fi
