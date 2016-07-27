#!/bin/bash
SITE_DOMAIN="translate.wordpressorg.dev"
BASE_DIR=$( dirname $( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ) )
PROVISION_DIR="$BASE_DIR/$SITE_DOMAIN/provision"
SITE_DIR="$BASE_DIR/$SITE_DOMAIN/public_html"

source $BASE_DIR/helper-functions.sh
wme_create_logs "$BASE_DIR/$SITE_DOMAIN/logs"

if [ ! -d $SITE_DIR ]; then
	printf "\n#\n# Provisioning $SITE_DOMAIN\n#\n"

	mkdir $SITE_DIR

	# Setup GlotPress, templates, and plugins
	svn co https://glotpress.svn.wordpress.org/trunk $SITE_DIR/glotpress
	svn co https://meta.svn.wordpress.org/sites/trunk/translate.wordpress.org/public_html/gp-templates@3264 $SITE_DIR/gp-templates/
	svn co https://meta.svn.wordpress.org/sites/trunk/translate.wordpress.org/includes/gp-plugins@3264 $SITE_DIR/gp-plugins/

	cp $PROVISION_DIR/gp-config.php $SITE_DIR

else
	printf "\n#\n# $SITE_DOMAIN cannot be updated right now. See https://github.com/WordPress/meta-environment/issues/54 for details.\n#\n"

fi

# Pull global header/footer
wme_pull_wporg_global_header $SITE_DIR gp_head
wme_pull_wporg_global_footer $SITE_DIR
