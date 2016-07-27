#!/bin/bash
SITE_DOMAIN="jobs.wordpressnet.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"
wme_svn_git_migration $SITE_DIR

if [ ! -L $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	# Don't overwrite existing databases if we're just migrating from SVN to Git
	if [[ ! $MIGRATED_TO_GIT ]]; then
		wme_import_database "jobs_wordpressnet_dev" $PROVISION_DIR
	fi

	wme_clone_meta_repository $BASE_DIR
	wme_symlink_public_dir $BASE_DIR $SITE_DOMAIN "jobs.wordpress.net"

	# Setup WordPress and plugins
	wp core download --version=nightly --path=$SITE_DIR/wordpress
	mkdir $SITE_DIR/wp-content/mu-plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	wp plugin install si-contact-form --path=$SITE_DIR/wordpress --allow-root

	# Ignore external dependencies and Meta Environment tweaks
	IGNORED_FILES=(
		/wordpress
		/wp-content/mu-plugins/sandbox-functionality.php
		/wp-content/plugins/si-contact-form
		/wp-config.php
	)
	wme_create_gitignore $SITE_DIR

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	git -C $SITE_DIR pull origin master
	wp core   update --version=nightly --path=$SITE_DIR/wordpress --allow-root
	wp plugin update --all             --path=$SITE_DIR/wordpress --allow-root

fi
