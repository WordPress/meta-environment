#!/bin/bash
SITE_DOMAIN="wordcamp.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_import_database "wordcamp_dev" $PROVISION_DIR

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress
	cp $PROVISION_DIR/wp-config.php $SITE_DIR

	# Check out WordCamp.org source code
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/ $SITE_DIR/wp-content
	svn co https://plugins.svn.wordpress.org/camptix-network-tools/trunk/                  $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn co https://plugins.svn.wordpress.org/email-post-changes/trunk/                     $SITE_DIR/wp-content/plugins/email-post-changes
	svn co https://plugins.svn.wordpress.org/tagregator/trunk/                             $SITE_DIR/wp-content/plugins/tagregator
	git clone https://github.com/Automattic/camptix.git                                    $SITE_DIR/wp-content/plugins/camptix

	# Setup mu-plugin for local development
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	# Install 3rd-party plugins
	wp plugin install akismet buddypress bbpress camptix-pagseguro camptix-payfast-gateway core-control debug-bar debug-bar-console debug-bar-cron jetpack wp-multibyte-patch wordpress-importer --path=$SITE_DIR/wordpress


else
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wp-content
	svn up $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn up $SITE_DIR/wp-content/plugins/email-post-changes
	svn up $SITE_DIR/wp-content/plugins/tagregator
	git -C $SITE_DIR/wp-content/plugins/camptix pull origin master
	wp core   update       --path=$SITE_DIR/wordpress
	wp plugin update --all --path=$SITE_DIR/wordpress
	wp theme  update --all --path=$SITE_DIR/wordpress

fi
