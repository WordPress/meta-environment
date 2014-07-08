#!/bin/bash

SITE_DIR="/srv/www/global.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning global.wordpress.dev\n"

	# Setup WordPress
	svn co https://core.svn.wordpress.org/trunk $SITE_DIR/wordpress
	cp /vagrant/config/wordpress-config/sites/global.wordpress.dev/wp-config.php $SITE_DIR

	# Setup plugins, themes and localizations
	svn co https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content $SITE_DIR/wp-content
	cp /vagrant/config/wordpress-config/sites/jobs.wordpress.dev/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	mkdir $SITE_DIR/wp-content/plugins
	wp plugin install akismet --path=$SITE_DIR/wordpress
	wp plugin install jetpack --path=$SITE_DIR/wordpress
	svn export http://i18n.svn.wordpress.org/ja/trunk/messages/            $SITE_DIR/wp-content/languages
	svn export http://i18n.svn.wordpress.org/es_ES/trunk/messages/ --force $SITE_DIR/wp-content/languages

else
	printf "\nUpdating global.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content
	wp plugin update --all --path=$SITE_DIR/wordpress

fi

# Pull global header/footer
curl -o $SITE_DIR/header.php  http://wordpress.org/header.php
echo "<?php wp_head(); ?>" >> $SITE_DIR/header.php
