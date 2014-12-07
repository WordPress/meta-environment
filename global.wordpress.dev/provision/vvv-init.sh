#!/bin/bash
SITE_DOMAIN="global.wordpress.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_import_database "global_wordpress_dev" $PROVISION_DIR

	# Setup WordPress
	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	cp $PROVISION_DIR/wp-config.php $SITE_DIR

	# Setup plugins, themes and localizations
	svn co https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content $SITE_DIR/wp-content
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	mkdir $SITE_DIR/wp-content/plugins
	wp plugin install akismet jetpack wp-multibyte-patch --path=$SITE_DIR/wordpress
	svn export https://i18n.svn.wordpress.org/ja/trunk/messages/            $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/ja/rosetta/           --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/trunk/messages/ --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/rosetta/        --force $SITE_DIR/wp-content/languages


else
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content
	wp plugin update --all --path=$SITE_DIR/wordpress

fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR
