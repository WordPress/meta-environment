#!/bin/bash

SITE_DIR="/srv/www/jobs.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning jobs.wordpress.dev\n"

	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	svn co https://meta.svn.wordpress.org/sites/trunk/jobs.wordpress.net/public_html/wp-content $SITE_DIR/wp-content
	mkdir $SITE_DIR/wp-content/mu-plugins
	cp /vagrant/config/wordpress-config/sites/jobs.wordpress.dev/wp-config.php $SITE_DIR
	cp /vagrant/config/wordpress-config/sites/jobs.wordpress.dev/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	wp plugin install si-contact-form --path=$SITE_DIR/wordpress

else
	printf "\nUpdating jobs.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content

fi
