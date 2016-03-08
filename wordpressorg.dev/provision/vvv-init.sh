#!/bin/bash
SITE_DOMAIN="wordpressorg.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"
SVN_PLUGINS=( akismet bbpress debug-bar debug-bar-cron email-post-changes speakerdeck-embed supportflow syntaxhighlighter wordpress-importer )
WPCLI_PLUGINS="jetpack tinymce-code-element wp-multibyte-patch"
CORE_LATEST_STABLE="4.3"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

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
	wp plugin install $WPCLI_PLUGINS --path=$SITE_DIR/wordpress --allow-root

	# developer.wordpressorg.dev
	composer create-project rmccue/wp-parser:dev-master $SITE_DIR/wp-content/plugins/wp-parser --no-dev --keep-vcs
	sudo gem install sass

	# global.wordpressorg.dev
	svn propset svn:externals 'rosetta https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content/themes/rosetta/'             $SITE_DIR/wp-content/themes
	svn up $SITE_DIR/wp-content/themes
	svn co https://meta.svn.wordpress.org/sites/trunk/global.wordpress.org/public_html/wp-content/mu-plugins/ $SITE_DIR/wp-content/mu-plugins/global_wordpressorg_dev

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

else
	printf "\n#\n# Updating $SITE_DOMAIN\n#\n"

	svn up $SITE_DIR
	svn up $SITE_DIR/wordpress
	svn up $SITE_DIR/wp-content
	svn up $SITE_DIR/wp-content/mu-plugins/global_wordpressorg_dev
	wp plugin update $WPCLI_PLUGINS --path=$SITE_DIR/wordpress --allow-root

	for i in "${SVN_PLUGINS[@]}"
	do :
		svn up $SITE_DIR/wp-content/plugins/$i
	done

	# developer.wordpressorg.dev
	# composer update rmccue/wp-parser # todo no composer.json file
	sudo gem update sass

fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR wp_head
wme_pull_wporg_global_footer $SITE_DIR wp_footer

# developer.wordpressorg.dev
scss --no-cache --update --style=expanded    $SITE_DIR/wp-content/themes/pub/wporg-developer/scss:$SITE_DIR/wp-content/themes/pub/wporg-developer/stylesheets
scss --no-cache --watch  --style=expanded -q $SITE_DIR/wp-content/themes/pub/wporg-developer/scss:$SITE_DIR/wp-content/themes/pub/wporg-developer/stylesheets &
