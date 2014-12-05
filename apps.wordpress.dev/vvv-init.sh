#!/bin/bash
SITE_DOMAIN="apps.wordpress.dev"
BASE_DIR=$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )
SCRIPT_DIR="$BASE_DIR/$SITE_DOMAIN"
SITE_DIR="/srv/www/apps.wordpress.dev"

source $BASE_DIR/helper-functions.sh

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning apps.wordpress.dev\n"

	wme_create_nginx_logs "/srv/log/$SITE_DOMAIN"

	# Import the database
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS apps_wordpress_dev;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON apps_wordpress_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root apps_wordpress_dev < $SCRIPT_DIR/apps_wordpress_dev.sql

	# Setup WordPress, plugins, and themes
	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	mkdir $SITE_DIR/wp-content/
	mkdir $SITE_DIR/wp-content/mu-plugins
	mkdir $SITE_DIR/wp-content/plugins
	mkdir $SITE_DIR/wp-content/themes
	svn co https://meta.svn.wordpress.org/sites/trunk/wordpress.org/public_html/wp-content/themes/pub/wporg-apps $SITE_DIR/wp-content/themes/wporg-apps
	cp $SCRIPT_DIR/wp-config.php             $SITE_DIR
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

else
	printf "\nUpdating apps.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content/themes/wporg-apps

fi
