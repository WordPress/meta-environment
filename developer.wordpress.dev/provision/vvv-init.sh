#!/bin/bash
SITE_DOMAIN="developer.wordpress.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_nginx_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_import_database   "developer_wordpress_dev" $PROVISION_DIR

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress
	cp $PROVISION_DIR/wp-config.php $SITE_DIR

	mkdir $SITE_DIR/content
	mkdir $SITE_DIR/content/mu-plugins
	mkdir $SITE_DIR/content/plugins
	mkdir $SITE_DIR/content/themes

	# Setup the theme
	git clone https://github.com/Rarst/wporg-developer $SITE_DIR/content/themes/wporg-developer

	# Setup plugins
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/content/mu-plugins/
	composer create-project rmccue/wp-parser:dev-master $SITE_DIR/content/plugins/wp-parser --no-dev --keep-vcs

	# todo setup cron job to rerun parser, or just let people run it manually?

	# Install SASS
	sudo gem install sass


else
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wordpress
	# composer update rmccue/wp-parser # todo no composer.json file
	git -C $SITE_DIR/content/themes/wporg-developer pull origin master
	sudo gem update sass

fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR/content/themes
wme_pull_wporg_global_footer $SITE_DIR/content/themes

# Compile SASS files
scss --no-cache --update --style=expanded    $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets &
