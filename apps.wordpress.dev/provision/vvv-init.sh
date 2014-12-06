#!/bin/bash
SITE_DOMAIN="apps.wordpress.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
SCRIPT_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_nginx_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_import_database   "apps_wordpress_dev" $SCRIPT_DIR

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
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content/themes/wporg-apps

fi
