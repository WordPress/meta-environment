#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SITE_DIR="/srv/www/jobs.wordpress.dev"
LOG_DIR="/srv/log/jobs.wordpress.dev"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning jobs.wordpress.dev\n"

	# Create Nginx logs
	sudo mkdir $LOG_DIR
	sudo touch $LOG_DIR/access.log
	sudo touch $LOG_DIR/error.log

	# Import the database
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS jobs_wordpress_dev;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON jobs_wordpress_dev.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root jobs_wordpress_dev < $SCRIPT_DIR/jobs_wordpress_dev.sql

	# Setup WordPress and plugins
	svn co https://core.svn.wordpress.org/trunk                                                 $SITE_DIR/wordpress
	svn co https://meta.svn.wordpress.org/sites/trunk/jobs.wordpress.net/public_html/wp-content $SITE_DIR/wp-content
	mkdir $SITE_DIR/wp-content/mu-plugins
	cp $SCRIPT_DIR/wp-config.php             $SITE_DIR
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	wp plugin install si-contact-form --path=$SITE_DIR/wordpress

else
	printf "\nUpdating jobs.wordpress.dev\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content

fi
