#!/usr/bin/env bash

set -ex

SITE_DIR="/srv/www/apps.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning apps.wordpress.dev\n"

	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	mkdir $SITE_DIR/wp-content/
	mkdir $SITE_DIR/wp-content/mu-plugins
	mkdir $SITE_DIR/wp-content/plugins
	mkdir $SITE_DIR/wp-content/themes
	svn co https://meta.svn.wordpress.org/sites/trunk/wordpress.org/public_html/wp-content/themes/pub/wporg-apps $SITE_DIR/wp-content/themes/wporg-apps
	cp /srv/config/wordpress-config/sites/apps.wordpress.dev/wp-config.php $SITE_DIR
	cp /srv/config/wordpress-config/sites/apps.wordpress.dev/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

else
	printf "\nUpdating apps.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content/themes/wporg-apps

fi
