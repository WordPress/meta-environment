#!/bin/bash
SITE_DOMAIN="jobs.wordpress.dev"
BASE_DIR=$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )
SCRIPT_DIR="$BASE_DIR/$SITE_DOMAIN"
SITE_DIR="/srv/www/$SITE_DOMAIN"

source $BASE_DIR/helper-functions.sh

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_create_nginx_logs "/srv/log/$SITE_DOMAIN"
	wme_import_database   "jobs_wordpress_dev" $SCRIPT_DIR

	# Setup WordPress and plugins
	svn co https://core.svn.wordpress.org/trunk                                                 $SITE_DIR/wordpress
	svn co https://meta.svn.wordpress.org/sites/trunk/jobs.wordpress.net/public_html/wp-content $SITE_DIR/wp-content
	mkdir $SITE_DIR/wp-content/mu-plugins
	cp $SCRIPT_DIR/wp-config.php             $SITE_DIR
	cp $SCRIPT_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	wp plugin install si-contact-form --path=$SITE_DIR/wordpress

else
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content

fi
