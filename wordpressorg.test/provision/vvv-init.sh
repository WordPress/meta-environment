#!/bin/bash
SITE_DOMAIN="wordpressorg.test"

BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
source $BASE_DIR/helper-functions.sh

wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [[ `wme_provision_site "${SITE_DOMAIN}"` == 'false' ]]; then
	echo "Provisioning of ${SITE_DOMAIN} skipped"
	return
fi

PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( akismet bbpress debug-bar debug-bar-cron email-post-changes speakerdeck-embed supportflow syntaxhighlighter two-factor wordpress-importer )
WPCLI_PLUGINS=( jetpack tinymce-code-element wp-multibyte-patch )
THEMES=( twenty* rosetta p2  )
WP_LOCALES=( ja es_ES )

wme_svn_git_migration $SITE_DIR

if [ ! -L $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	if [[ ! $MIGRATED_TO_GIT ]]; then
		wme_import_database "wordpressorg_dev" $PROVISION_DIR
	fi

	wme_clone_meta_repository $BASE_DIR
	wme_symlink_public_dir $BASE_DIR $SITE_DOMAIN "wordpress.org"
	wme_symlink_logs_dir $BASE_DIR $SITE_DOMAIN "wordpress.org"

	# Setup WordPress, themes, and plugins
	wme_noroot wp core download --version=nightly --path=$SITE_DIR/wordpress
	mkdir -p $SITE_DIR/wp-content/mu-plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/wp-cli.yml                $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	cp $PROVISION_DIR/sunrise.php               $SITE_DIR/wp-content

	svn co https://wpcom-themes.svn.automattic.com/p2 $SITE_DIR/wp-content/themes/p2

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn co https://plugins.svn.wordpress.org/$i/trunk $SITE_DIR/wp-content/plugins/$i
	done

	wme_noroot wp plugin install ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress

	# developer.wordpressorg.test
	cd $SITE_DIR/wp-content/plugins
	git clone https://github.com/WordPress/phpdoc-parser.git
	cd phpdoc-parser
	wme_noroot composer install

	# translate.wordpressorg.test
	git clone https://github.com/GlotPress/GlotPress-WP.git $SITE_DIR/wp-content/plugins/glotpress

	# global.wordpressorg.test
	cd $SITE_DIR/wp-content/themes
	ln -sr $BASE_DIR/meta-repository/global.wordpress.org/public_html/wp-content/themes/rosetta rosetta
	cd $SITE_DIR/wp-content/mu-plugins
	ln -sr $BASE_DIR/meta-repository/global.wordpress.org/public_html/wp-content/mu-plugins global_wordpressorg_dev

	mkdir $SITE_DIR/wp-content/languages
	mkdir $SITE_DIR/wp-content/languages/themes
	mkdir $SITE_DIR/wp-content/languages/plugins

	wme_noroot wp language core install ${WP_LOCALES[@]} --path=$SITE_DIR/wordpress
	wme_noroot wp language core update --path=$SITE_DIR/wordpress # Get plugin/theme translations

	printf "Installing translations from translate.wordpress.org..."
	for locale in "${WP_LOCALES[@]}"
	do :
		gplocale=${locale%_*}

		wme_download_pomo "${gplocale}" "meta/rosetta" "$SITE_DIR/wp-content/languages/plugins/rosetta-${locale}"
		wme_download_pomo "${gplocale}" "meta/themes" "$SITE_DIR/wp-content/languages/plugins/wporg-themes-${locale}"
		wme_download_pomo "${gplocale}" "meta/plugins-v3" "$SITE_DIR/wp-content/languages/plugins/wporg-plugins-${locale}"
		wme_download_pomo "${gplocale}" "meta/forums" "$SITE_DIR/wp-content/languages/themes/wporg-forums-${locale}"
		wme_download_pomo "${gplocale}" "meta/p2-breathe" "$SITE_DIR/wp-content/languages/themes/p2-breathe-${locale}"
		wme_download_pomo "${gplocale}" "meta/o2" "$SITE_DIR/wp-content/languages/themes/o2-${locale}"
	done

	# Cavalcade
	printf "Installing Cavalcade..."
	git clone https://github.com/humanmade/Cavalcade.git $SITE_DIR/wp-content/mu-plugins/cavalcade
	cp $PROVISION_DIR/cavalcade.php $SITE_DIR/wp-content/mu-plugins/

	if [[ ! -d "/etc/cavalcade" ]]; then
		git clone https://github.com/humanmade/Cavalcade-Runner.git /etc/cavalcade
	else
		git -C /etc/cavalcade pull
	fi

	cp "$PROVISION_DIR/cavalcade-wordpressorg.conf" "/etc/init/cavalcade-wordpressorg.conf"
	service cavalcade-wordpressorg restart

	# Ignore external dependencies and Meta Environment tweaks
	IGNORED_FILES=(
		**/wordpress
		**/wp-content/languages
		**/wp-content/mu-plugins/cavalcade*
		**/wp-content/mu-plugins/global_wordpressorg_dev
		**/wp-content/mu-plugins/sandbox-functionality.php
		**/wp-content/sunrise.php
		wordpress.org/footer.php
		wordpress.org/header.php
		**/wp-config.php
		**/wp-cli.yml
	)
	IGNORED_FILES=( "${IGNORED_FILES[@]}" "${SVN_PLUGINS[@]}" "${GIT_PLUGINS[@]}" "${WPCLI_PLUGINS[@]}" "${THEMES[@]}" )
	wme_create_git_exclude "$BASE_DIR/meta-repository"

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	git -C $SITE_DIR pull origin master
	wme_noroot wp core   update --version=nightly   --path=$SITE_DIR/wordpress
	wme_noroot wp plugin update ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress
	wme_noroot wp language core update              --path=$SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content/themes/p2

	printf "Updating translations from translate.wordpress.org..."
	for locale in "${WP_LOCALES[@]}"
	do :
		gplocale=${locale%_*}

		wme_download_pomo "${gplocale}" "meta/rosetta" "$SITE_DIR/wp-content/languages/plugins/rosetta-${locale}"
		wme_download_pomo "${gplocale}" "meta/themes" "$SITE_DIR/wp-content/languages/plugins/wporg-themes-${locale}"
		wme_download_pomo "${gplocale}" "meta/plugins-v3" "$SITE_DIR/wp-content/languages/plugins/wporg-plugins-${locale}"
		wme_download_pomo "${gplocale}" "meta/forums" "$SITE_DIR/wp-content/languages/themes/wporg-forums-${locale}"
		wme_download_pomo "${gplocale}" "meta/p2-breathe" "$SITE_DIR/wp-content/languages/themes/p2-breathe-${locale}"
		wme_download_pomo "${gplocale}" "meta/o2" "$SITE_DIR/wp-content/languages/themes/o2-${locale}"
	done

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn up $SITE_DIR/wp-content/plugins/$i
	done

	# developer.wordpressorg.test
	git -C $SITE_DIR/wp-content/plugins/phpdoc-parser pull

	# translate.wordpressorg.test
	git -C $SITE_DIR/wp-content/plugins/glotpress pull

	# Cavalcade
	git -C $SITE_DIR/wp-content/mu-plugins/cavalcade pull
	git -C /etc/cavalcade pull
	cp "$PROVISION_DIR/cavalcade.php" "$SITE_DIR/wp-content/mu-plugins/"
	cp "$PROVISION_DIR/cavalcade-wordpressorg.conf" "/etc/init/cavalcade-wordpressorg.conf"
	service cavalcade-wordpressorg restart
fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR
wme_pull_wporg_global_footer $SITE_DIR
