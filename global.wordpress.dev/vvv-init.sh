#!/bin/bash
BASE_DIR=$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )
SCRIPT_DIR="$BASE_DIR/global.wordpress.dev"
SITE_DIR="/srv/www/global.wordpress.dev"
LOG_DIR="/srv/log/global.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning global.wordpress.dev\n"

	# Create Nginx logs
	sudo mkdir $LOG_DIR
	sudo touch $LOG_DIR/access.log
	sudo touch $LOG_DIR/error.log

	# Import the database
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS global_wordpress_dev;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON global_wordpress_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root global_wordpress_dev < $SCRIPT_DIR/global_wordpress_dev.sql
	
	# Setup WordPress
	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	cp $SCRIPT_DIR/wp-config.php $SITE_DIR

	# Setup plugins, themes and localizations
	svn co https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content $SITE_DIR/wp-content
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	mkdir $SITE_DIR/wp-content/plugins
	wp plugin install akismet jetpack wp-multibyte-patch --path=$SITE_DIR/wordpress
	svn export https://i18n.svn.wordpress.org/ja/trunk/messages/            $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/ja/rosetta/           --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/trunk/messages/ --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/rosetta/        --force $SITE_DIR/wp-content/languages


else
	printf "\nUpdating global.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content
	wp plugin update --all --path=$SITE_DIR/wordpress

fi

# Pull global header/footer
source $BASE_DIR/helper-functions.sh
pull_wporg_global_header $SITE_DIR
