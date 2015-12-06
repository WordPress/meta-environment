#!/bin/bash
SITE_DOMAIN="wordcamp.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( camptix-network-tools email-post-changes tagregator )
WPCLI_PLUGINS="akismet buddypress bbpress camptix-pagseguro camptix-payfast-gateway core-control debug-bar debug-bar-console debug-bar-cron jetpack wp-multibyte-patch wordpress-importer json-rest-api"
WPCLI_THEMES="twentyten"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	wme_import_database "wordcamp_dev" $PROVISION_DIR

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress --allow-root
	cp $PROVISION_DIR/wp-config.php $SITE_DIR

	# Check out WordCamp.org source code
	svn co https://meta.svn.wordpress.org/sites/trunk/wordcamp.org/public_html/wp-content/ $SITE_DIR/wp-content

	for i in "${SVN_PLUGINS[@]}"
	do :
		echo "$i https://plugins.svn.wordpress.org/$i/trunk" >> $PROVISION_DIR/svn-externals.tmp
	done

	svn propset svn:externals -F $PROVISION_DIR/svn-externals.tmp $SITE_DIR/wp-content/plugins
	svn up $SITE_DIR/wp-content/plugins
	rm -f $PROVISION_DIR/svn-externals.tmp

	git clone https://github.com/Automattic/camptix.git $SITE_DIR/wp-content/plugins/camptix

	# Setup mu-plugin for local development
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	# Install extra plugins and themes
	wp plugin install $WPCLI_PLUGINS --path=$SITE_DIR/wordpress --allow-root
	wp theme  install $WPCLI_THEMES  --path=$SITE_DIR/wordpress --allow-root

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	svn up $SITE_DIR/wp-content
	svn up $SITE_DIR/wp-content/plugins/camptix-network-tools
	svn up $SITE_DIR/wp-content/plugins/email-post-changes
	svn up $SITE_DIR/wp-content/plugins/tagregator
	git -C $SITE_DIR/wp-content/plugins/camptix pull origin master
	wp core   update                --path=$SITE_DIR/wordpress --allow-root
	wp plugin update $WPCLI_PLUGINS --path=$SITE_DIR/wordpress --allow-root
	wp theme  update $WPCLI_THEMES  --path=$SITE_DIR/wordpress --allow-root

fi
