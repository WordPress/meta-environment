#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SITE_DIR="/srv/www/developer.wordpress.dev"
LOG_DIR="/srv/log/developer.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning developer.wordpress.dev\n"

	# Create Nginx logs
	sudo mkdir $LOG_DIR
	sudo touch $LOG_DIR/access.log
	sudo touch $LOG_DIR/error.log

	# Import the database
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS developer_wordpress_dev;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON developer_wordpress_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root developer_wordpress_dev < $SCRIPT_DIR/developer_wordpress_dev.sql

	# Setup WordPress
	wp core download --path=$SITE_DIR/wordpress
	cp $SCRIPT_DIR/wp-config.php $SITE_DIR

	mkdir $SITE_DIR/content
	mkdir $SITE_DIR/content/mu-plugins
	mkdir $SITE_DIR/content/plugins
	mkdir $SITE_DIR/content/themes

	# Setup the theme
	git clone https://github.com/Rarst/wporg-developer $SITE_DIR/content/themes/wporg-developer

	# Setup plugins
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/content/mu-plugins/
	composer create-project rmccue/wp-parser:dev-master $SITE_DIR/content/plugins/wp-parser --no-dev --keep-vcs

	# todo setup cron job to rerun parser, or just let people run it manually?

	# Install SASS
	sudo gem install sass


else
	printf "\nUpdating developer.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	# composer update rmccue/wp-parser # todo no composer.json file
	git -C $SITE_DIR/content/themes/wporg-developer pull origin master
	sudo gem update sass

fi

# Pull global header/footer
curl -o $SITE_DIR/content/themes/header.php        https://wordpress.org/header.php
curl -o $SITE_DIR/content/themes/footer.php        https://wordpress.org/footer.php
echo "<?php wp_head(); ?>" >>                      $SITE_DIR/content/themes/header.php
sed -i 's/<\/body>/\n<?php wp_footer(); ?>\n\n&/'  $SITE_DIR/content/themes/footer.php

# Compile SASS files
scss --no-cache --update --style=expanded    $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/content/themes/wporg-developer/scss:$SITE_DIR/content/themes/wporg-developer/stylesheets &
