#!/bin/bash

SITE_DIR="/srv/www/developer.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning developer.wordpress.dev\n"

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress
	cp /vagrant/config/wordpress-config/sites/developer.wordpress.dev/wp-config.php $SITE_DIR

	mkdir $SITE_DIR/content
	mkdir $SITE_DIR/content/mu-plugins
	mkdir $SITE_DIR/content/plugins
	mkdir $SITE_DIR/content/themes

	# Setup the theme
	git clone https://github.com/Rarst/wporg-developer $SITE_DIR/content/themes/wporg-developer

	# Setup plugins
	cp /vagrant/config/wordpress-config/sites/developer.wordpress.dev/sandbox-functionality.php $SITE_DIR/content/mu-plugins/
	composer create-project rmccue/wp-parser:dev-master $SITE_DIR/content/plugins/wp-parser --no-dev --keep-vcs

	# todo setup cron job to rerun parser, or just let people run it manually?

else
	printf "\nUpdating developer.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	# composer update rmccue/wp-parser # todo no composer.json file
	git -C $SITE_DIR/content/themes/wporg-developer pull origin master

fi

# Pull global header/footer
curl -o $SITE_DIR/content/themes/header.php        https://wordpress.org/header.php
curl -o $SITE_DIR/content/themes/footer.php        https://wordpress.org/footer.php
echo "<?php wp_head(); ?>" >>                      $SITE_DIR/content/themes/header.php
sed -i 's/<\/body>/\n<?php wp_footer(); ?>\n\n&/'  $SITE_DIR/content/themes/footer.php

# Compile SASS files
scss --no-cache --update --style=expanded    $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets &
