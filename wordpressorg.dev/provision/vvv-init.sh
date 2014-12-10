#!/bin/bash
SITE_DOMAIN="wordpressorg.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( akismet bbpress debug-bar debug-bar-cron email-post-changes speakerdeck-embed supportflow syntaxhighlighter wordpress-importer )
WPCLI_PLUGINS="jetpack tinymce-code-element wp-multibyte-patch"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\nProvisioning $SITE_DOMAIN\n"

	wme_import_database "wordpressorg_dev" $PROVISION_DIR

	# Setup WordPress, themes, and plugins
	svn co https://meta.svn.wordpress.org/sites/trunk/wordpress.org/public_html $SITE_DIR
	svn co https://core.svn.wordpress.org/trunk                                 $SITE_DIR/wordpress
	mkdir $SITE_DIR/wp-content/mu-plugins
	cp $PROVISION_DIR/wp-config.php             $SITE_DIR
	cp $PROVISION_DIR/sandbox-functionality.php $SITE_DIR/wp-content/mu-plugins/

	svn propset svn:externals 'p2 https://wpcom-themes.svn.automattic.com/p2' $SITE_DIR/wp-content/themes
	svn up $SITE_DIR/wp-content/themes

	for i in "${SVN_PLUGINS[@]}"
	do :
		echo "$i https://plugins.svn.wordpress.org/$i/trunk" >> $PROVISION_DIR/svn-externals.tmp
	done

	svn propset svn:externals -F $PROVISION_DIR/svn-externals.tmp $SITE_DIR/wp-content/plugins
	svn up $SITE_DIR/wp-content/plugins
	rm -f $PROVISION_DIR/svn-externals.tmp
	wp plugin install $WPCLI_PLUGINS --path=$SITE_DIR/wordpress

	# developer.wordpressorg.dev
	composer create-project rmccue/wp-parser:dev-master $SITE_DIR/wp-content/plugins/wp-parser --no-dev --keep-vcs
	sudo gem install sass

	# global.wordpressorg.dev
	svn propset svn:externals 'rosetta https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content/themes/rosetta/'             $SITE_DIR/wp-content/themes
	svn up $SITE_DIR/wp-content/themes
	svn co https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content/mu-plugins/ $SITE_DIR/wp-content/mu-plugins/global_wordpressorg_dev

	svn export https://i18n.svn.wordpress.org/ja/trunk/messages/            $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/ja/rosetta/           --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/trunk/messages/ --force $SITE_DIR/wp-content/languages
	svn export https://i18n.svn.wordpress.org/es_ES/rosetta/        --force $SITE_DIR/wp-content/languages

else
	printf "\nUpdating $SITE_DOMAIN\n"

	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content
	wp plugin update $WPCLI_PLUGINS --path=$SITE_DIR/wordpress

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn up $SITE_DIR/wp-content/plugins/$i
	done

	# developer.wordpressorg.dev
	# composer update rmccue/wp-parser # todo no composer.json file
	sudo gem update sass

fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR
wme_pull_wporg_global_footer $SITE_DIR

# developer.wordpressorg.dev
scss --no-cache --update --style=expanded    $SITE_DIR/wp-content/themes/wporg-developer/scss:$SITE_DIR/wp-content/themes/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/wp-content/themes/wporg-developer/scss:$SITE_DIR/wp-content/themes/wporg-developer/stylesheets &
