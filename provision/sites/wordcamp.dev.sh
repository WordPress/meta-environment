#!/bin/bash

SITE_DIR="/srv/www/wordcamp.dev"

if [ ! -d $SITE_DIR ]; then
	echo "Provisioning wordcamp.dev"

	# Setup WordPress
	mkdir $SITE_DIR/wp-content/mu-plugins
	wp core download --path=$SITE_DIR/wordpress
	cp /vagrant/config/wordpress-config/sites/wordcamp.dev/wp-config.php             $SITE_DIR
	cp /vagrant/config/wordpress-config/sites/wordcamp.dev/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	# Check out WordCamp.org source code
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/ $SITE_DIR/wp-content
	svn co https://plugins.svn.wordpress.org/camptix/trunk/                                $SITE_DIR/wp-content/plugins/camptix
    svn co https://plugins.svn.wordpress.org/camptix-network-tools/trunk/                  $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn co https://plugins.svn.wordpress.org/email-post-changes/trunk/                     $SITE_DIR/wp-content/plugins/email-post-changes
	svn co https://plugins.svn.wordpress.org/tagregator/trunk/                             $SITE_DIR/wp-content/plugins/tagregator

	# Install 3rd-party plugins
	PLUGINS=( akismet buddypress bbpress camptix-pagseguro camptix-payfast-gateway core-control debug-bar debug-bar-console debug-bar-cron jetpack wp-multibyte-patch wordpress-importer )
	for i in "${PLUGINS[@]}"
	do :
	   wp plugin install $i --path=$SITE_DIR/wordpress
	done

else
	echo "\nUpdating wordcamp.dev"

	svn up $SITE_DIR/wp-content
	svn up $SITE_DIR/wp-content/plugins/camptix
    svn up $SITE_DIR/wp-content/plugins/camptix-network-tools
    svn up $SITE_DIR/wp-content/plugins/email-post-changes
    svn up $SITE_DIR/wp-content/plugins/tagregator
	wp core   update       --path=$SITE_DIR/wordpress
	wp plugin update --all --path=$SITE_DIR/wordpress
	wp theme  update --all --path=$SITE_DIR/wordpress

fi
