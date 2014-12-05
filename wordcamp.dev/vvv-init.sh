#!/bin/bash
SITE_DOMAIN="wordcamp.dev"
BASE_DIR=$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )
SCRIPT_DIR="$BASE_DIR/$SITE_DOMAIN"
SITE_DIR="/srv/www/wordcamp.dev"

source $BASE_DIR/helper-functions.sh

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning wordcamp.dev\n"

	wme_create_nginx_logs "/srv/log/$SITE_DOMAIN"

	# Import the database
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS wordcamp_dev;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON wordcamp_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root wordcamp_dev < $SCRIPT_DIR/wordcamp_dev.sql

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress
	cp $SCRIPT_DIR/wp-config.php $SITE_DIR

	# Check out WordCamp.org source code
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/ $SITE_DIR/wp-content
	svn co https://plugins.svn.wordpress.org/camptix-network-tools/trunk/                  $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn co https://plugins.svn.wordpress.org/email-post-changes/trunk/                     $SITE_DIR/wp-content/plugins/email-post-changes
	svn co https://plugins.svn.wordpress.org/tagregator/trunk/                             $SITE_DIR/wp-content/plugins/tagregator
	git clone https://github.com/Automattic/camptix.git                                    $SITE_DIR/wp-content/plugins/camptix

	# Setup mu-plugin for local development
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	# Install 3rd-party plugins
	wp plugin install akismet buddypress bbpress camptix-pagseguro camptix-payfast-gateway core-control debug-bar debug-bar-console debug-bar-cron jetpack wp-multibyte-patch wordpress-importer --path=$SITE_DIR/wordpress


else
	printf "\nUpdating wordcamp.dev\n"

	svn up $SITE_DIR/wp-content
	svn up $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn up $SITE_DIR/wp-content/plugins/email-post-changes
	svn up $SITE_DIR/wp-content/plugins/tagregator
	git -C $SITE_DIR/wp-content/plugins/camptix pull origin master
	wp core   update       --path=$SITE_DIR/wordpress
	wp plugin update --all --path=$SITE_DIR/wordpress
	wp theme  update --all --path=$SITE_DIR/wordpress

fi
