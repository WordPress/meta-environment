#!/bin/bash

SITE_DIR="/srv/www/developer.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning developer.wordpress.dev\n"

	# Setup WordPress
	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
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
	wp plugin activate wp-parser --path=$SITE_DIR/wordpress
	wp parser create $SITE_DIR/wordpress --user=1 --path=$SITE_DIR/wordpress

	# todo setup cron job to rerun parser?

else
	printf "\nUpdating developer.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	# composer update rmccue/wp-parser # todo no composer.json file
	git -C $SITE_DIR/content/themes/wporg-developer pull origin master

	# todo re-run parser here if don't setup automated job during provisioning

fi

# Pull global header/footer
curl -o $SITE_DIR/content/themes/header.php        http://wordpress.org/header.php
curl -o $SITE_DIR/content/themes/footer.php        http://wordpress.org/footer.php
echo "<?php wp_head(); ?>" >>                      $SITE_DIR/content/themes/header.php
sed -i 's/<\/body>/\n<?php wp_footer(); ?>\n\n&/'  $SITE_DIR/content/themes/footer.php

# Compile SASS files
scss --no-cache --update --style=expanded    $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets &
