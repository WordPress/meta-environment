#!/bin/bash
SITE_DOMAIN="wordcamp.test"

BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
source $BASE_DIR/helper-functions.sh

wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [[ `wme_provision_site "${SITE_DOMAIN}"` == 'false' ]]; then
	echo "Provisioning of ${SITE_DOMAIN} skipped"
	return
fi

BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( camptix-network-tools email-post-changes tagregator supportflow camptix-pagseguro camptix-payfast-gateway camptix-trustpay camptix-trustcard camptix-mercadopago camptix-kdcpay-gateway campt-indian-payment-gateway )
WPCLI_PLUGINS=( akismet buddypress bbpress jetpack wp-multibyte-patch wordpress-importer polldaddy liveblog wp-super-cache custom-content-width )
WPCLI_THEMES=( twentyten twentyeleven twentytwelve twentythirteen )

wme_svn_git_migration $SITE_DIR

# Install wkhtmltopdf for wordcamp-docs plugin
if [ ! -f /usr/local/bin/wkhtmltopdf ];
then
	apt-get install -y wkhtmltopdf xvfb
	echo 'xvfb-run --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf $*' | sudo tee /usr/bin/wkhtmltopdf.sh > /dev/null
	chmod a+x /usr/bin/wkhtmltopdf.sh
	ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf
fi

if [ ! -L $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	# Don't overwrite existing databases if we're just migrating from SVN to Git
	if [[ ! $MIGRATED_TO_GIT ]]; then
		wme_import_database "wordcamp_dev" $PROVISION_DIR
	fi

	wme_clone_meta_repository $BASE_DIR
	wme_symlink_public_dir $BASE_DIR $SITE_DOMAIN "wordcamp.org"
	wme_symlink_logs_dir $BASE_DIR $SITE_DOMAIN "wordcamp.org"

	# Setup WordPress
	wme_noroot wp core download --path=$SITE_DIR/wordpress
	cp $PROVISION_DIR/wp-config.php $SITE_DIR

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn co https://plugins.svn.wordpress.org/$i/trunk $SITE_DIR/wp-content/plugins/$i
	done

	git clone https://github.com/Automattic/camptix.git $SITE_DIR/wp-content/plugins/camptix

	# Setup mu-plugin for local development
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	# Install extra plugins and themes
	wme_noroot wp plugin install ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress
	wme_noroot wp theme  install ${WPCLI_THEMES[@]}  --path=$SITE_DIR/wordpress

	# Ignore external dependencies and Meta Environment tweaks
	IGNORED_FILES=(
		/wordpress
		/wp-content/mu-plugins/sandbox-functionality.php
		/wp-content/plugins/camptix
		/wp-config.php
	)
	IGNORED_FILES=( "${IGNORED_FILES[@]}" "${SVN_PLUGINS[@]}" "${WPCLI_PLUGINS[@]}" "${WPCLI_THEMES[@]}" )
	wme_create_gitignore $SITE_DIR

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	git -C $SITE_DIR pull origin master

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn up $SITE_DIR/wp-content/plugins/$i
	done

	git -C $SITE_DIR/wp-content/plugins/camptix pull origin master

	wme_noroot wp core   update                     --path=$SITE_DIR/wordpress
	wme_noroot wp plugin update ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress
	wme_noroot wp theme  update ${WPCLI_THEMES[@]}  --path=$SITE_DIR/wordpress

fi
