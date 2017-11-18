#!/bin/bash
SITE_DOMAIN="wordpresstv.test"

BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
source $BASE_DIR/helper-functions.sh

wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [[ `wme_provision_site "${SITE_DOMAIN}"` == 'false' ]]; then
	echo "Provisioning of ${SITE_DOMAIN} skipped"
	return
fi

PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
WPCLI_PLUGINS=( jetpack )

wme_svn_git_migration $SITE_DIR

if [ ! -L $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	if [[ ! $MIGRATED_TO_GIT ]]; then
		wme_import_database "wordpresstv_dev" $PROVISION_DIR
	fi

	wme_clone_meta_repository $BASE_DIR
	wme_symlink_public_dir $BASE_DIR $SITE_DOMAIN "wordpress.tv"
	wme_symlink_logs_dir $BASE_DIR $SITE_DOMAIN "wordpress.tv"

	# Setup WordPress and plugins
	wme_noroot wp core download --version=nightly --path=$SITE_DIR/wordpress
	mkdir -p $SITE_DIR/wp-content/mu-plugins
	mkdir -p $SITE_DIR/wp-content/plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	wme_noroot wp plugin install ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress

	# Ignore external dependencies and Meta Environment tweaks
	IGNORED_FILES=(
		/wordpress
		/wp-content/mu-plugins/sandbox-functionality.php
		/wp-config.php
	)
	IGNORED_FILES=( "${IGNORED_FILES[@]}" "${WPCLI_PLUGINS[@]}" )
	wme_create_gitignore $SITE_DIR

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	git -C $SITE_DIR pull origin master
	wme_noroot wp core   update --version=nightly --path=$SITE_DIR/wordpress
	wme_noroot wp plugin update --all             --path=$SITE_DIR/wordpress

fi
