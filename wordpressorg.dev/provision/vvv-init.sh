#!/bin/bash
SITE_DOMAIN="wordpressorg.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( akismet bbpress debug-bar debug-bar-cron email-post-changes speakerdeck-embed supportflow syntaxhighlighter wordpress-importer )
WPCLI_PLUGINS=( jetpack tinymce-code-element wp-multibyte-patch )
CORE_LATEST_STABLE="4.6"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"
wme_svn_git_migration $SITE_DIR

if [ ! -L $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	if [[ ! $MIGRATED_TO_GIT ]]; then
		wme_import_database "wordpressorg_dev" $PROVISION_DIR
	fi

	wme_clone_meta_repository $BASE_DIR
	wme_symlink_public_dir $BASE_DIR $SITE_DOMAIN "wordpress.org"

	# Setup WordPress, themes, and plugins
	wme_noroot wp core download --version=nightly --path=$SITE_DIR/wordpress
	mkdir -p $SITE_DIR/wp-content/mu-plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/
	cp $PROVISION_DIR/sunrise.php               $SITE_DIR/wp-content

	svn co https://wpcom-themes.svn.automattic.com/p2 $SITE_DIR/wp-content/themes/p2

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn co https://plugins.svn.wordpress.org/$i/trunk $SITE_DIR/wp-content/plugins/$i
	done

	wme_noroot wp plugin install ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress

	# developer.wordpressorg.dev
	cd $SITE_DIR/wp-content/plugins
	git clone https://github.com/WordPress/phpdoc-parser.git
	cd phpdoc-parser
	wme_noroot composer install

	# global.wordpressorg.dev
	cd $SITE_DIR/wp-content/themes
	ln -sr $BASE_DIR/meta-repository/global.wordpress.org/public_html/wp-content/themes/rosetta rosetta
	cd $SITE_DIR/wp-content/mu-plugins
	ln -sr $BASE_DIR/meta-repository/global.wordpress.org/public_html/wp-content/mu-plugins global_wordpressorg_dev

	mkdir $SITE_DIR/wp-content/languages
	mkdir $SITE_DIR/wp-content/languages/themes
	mkdir $SITE_DIR/wp-content/languages/rosetta

	wget https://downloads.wordpress.org/translation/core/$CORE_LATEST_STABLE/ja.zip -O $SITE_DIR/wp-content/languages/ja.zip
	unzip $SITE_DIR/wp-content/languages/ja.zip -d $SITE_DIR/wp-content/languages/
	rm -f $SITE_DIR/wp-content/languages/ja.zip

	wget https://downloads.wordpress.org/translation/core/$CORE_LATEST_STABLE/es_ES.zip -O $SITE_DIR/wp-content/languages/es_ES.zip
	unzip $SITE_DIR/wp-content/languages/es_ES.zip -d $SITE_DIR/wp-content/languages/
	rm -f $SITE_DIR/wp-content/languages/es_ES.zip

	wget https://translate.wordpress.org/projects/meta/rosetta/ja/default/export-translations?format=mo -O $SITE_DIR/wp-content/languages/rosetta/rosetta-ja.mo
	wget https://translate.wordpress.org/projects/meta/rosetta/ja/default/export-translations?format=po -O $SITE_DIR/wp-content/languages/rosetta/rosetta-ja.po
	wget https://translate.wordpress.org/projects/meta/rosetta/es/default/export-translations?format=mo -O $SITE_DIR/wp-content/languages/rosetta/rosetta-es_ES.mo
	wget https://translate.wordpress.org/projects/meta/rosetta/es/default/export-translations?format=po -O $SITE_DIR/wp-content/languages/rosetta/rosetta-es_ES.po
	wget https://translate.wordpress.org/projects/meta/themes/es/default/export-translations?format=mo -O $SITE_DIR/wp-content/languages/themes/wporg-themes-es_ES.mo
	wget https://translate.wordpress.org/projects/meta/themes/es/default/export-translations?format=po -O $SITE_DIR/wp-content/languages/themes/wporg-themes-es_ES.po

	# Ignore external dependencies and Meta Environment tweaks
	IGNORED_FILES=(
		/wordpress
		/wp-content/languages
		/wp-content/mu-plugins/global_wordpressorg_dev
		/wp-content/mu-plugins/sandbox-functionality.php
		/wp-content/plugins/phpdoc-parser
		/wp-content/themes/p2
		/wp-content/themes/rosetta
		/wp-content/sunrise.php
		/footer.php
		/header.php
		/wp-config.php
	)
	IGNORED_FILES=( "${IGNORED_FILES[@]}" "${SVN_PLUGINS[@]}" "${WPCLI_PLUGINS[@]}" )
	wme_create_gitignore $SITE_DIR

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	git -C $SITE_DIR pull origin master
	wme_noroot wp core   update --version=nightly   --path=$SITE_DIR/wordpress
	wme_noroot wp plugin update ${WPCLI_PLUGINS[@]} --path=$SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content/themes/p2

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn up $SITE_DIR/wp-content/plugins/$i
	done

	# developer.wordpressorg.dev
	git -C $SITE_DIR/wp-content/plugins/phpdoc-parser pull
fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR wp_head
wme_pull_wporg_global_footer $SITE_DIR wp_footer
