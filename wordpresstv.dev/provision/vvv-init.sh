#!/bin/bash 
SITE_DOMAIN="wordpresstv.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	wme_import_database "wordpresstv_dev" $PROVISION_DIR

	# Setup WordPress and plugins
	svn co https://core.svn.wordpress.org/trunk                                            $SITE_DIR/wordpress
	svn co https://meta.svn.wordpress.org/sites/trunk/wordpress.tv/public_html/wp-content/ $SITE_DIR/content
	mkdir $SITE_DIR/content/mu-plugins
	mkdir $SITE_DIR/content/plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/content/mu-plugins/
	wp plugin install jetpack --path=$SITE_DIR/wordpress --allow-root


else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/content
	wp plugin update --all --path=$SITE_DIR/wordpress --allow-root

fi
