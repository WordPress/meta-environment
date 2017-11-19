#!/bin/bash

# Clone the Meta repository
#
# We create a full repository rather than using Git submodules, because having to learn to use submodules would
# create an extra barrier to entry for new contributors.
#
# $1 - the base folder
function wme_clone_meta_repository {
	local REPOSITORY_DIR="$1/meta-repository"

	if [ -d $REPOSITORY_DIR ]; then
		return 0
	fi

	git clone git://meta.git.wordpress.org/ $REPOSITORY_DIR
	git -C $REPOSITORY_DIR config diff.noprefix true
}

# Symlink each site's public_html folder to the corresponding Meta repository
#
# The Git mirror of the Meta repository has all sites in a single repo, just like the SVN repo. Git doesn't support
# cloning a sub-tree of a repository, though. The best solution is to just have a single copy of the entire repo,
# and then symlink each site's public_html folder.
#
# $1 - the site's root directory
# $2 - the name of the site's folder in the Meta Environment
# $3 - the name of the site's folder in the Meta repository
function wme_symlink_public_dir {
	PUBLIC_DIR_PATH="$1/meta-repository/$3/public_html/"

	cd "$1/$2"
	ln -rs $PUBLIC_DIR_PATH public_html
	mkdir -p $PUBLIC_DIR_PATH
}

# Symlink each site's log folder to the default log folder.
#
# $1 - the site's root directory
# $2 - the name of the site's folder in the Meta Environment
# $3 - the name of the site's folder in the Meta repository
function wme_symlink_logs_dir {
	LOGS_DIR_PATH="$1/$2/logs"

	cd "$1/meta-repository/$3"
	ln -rs $LOGS_DIR_PATH logs
	mkdir -p $LOGS_DIR_PATH
}

# Add entries to the .git/info/exclude file
#
# $1 - the site's web root
function wme_create_git_exclude {
	for i in "${IGNORED_FILES[@]}"
	do :
		echo "$i" >> $1/.git/info/exclude
	done
	awk '!a[$0]++' $1/.git/info/exclude > exclude && mv exclude $1/.git/info/exclude
}

# Download the global WordPress.org header into the given directory.
#
# This is a workaround because the header isn't open-sourced yet
#
# $1 - the absolute path to the folder where the header should be placed
function wme_pull_wporg_global_header {
	curl -so $1/header.php https://wordpress.org/header.php

	sed -i "s/<\/head>/\n<?php\nif ( function_exists( 'gp_head' ) ) {\n\tgp_head();\n} else {\n\twp_head();\n}\n?>\n\n&/" $1/header.php
	sed -i "s/<body id=\"wordpress-org\"/<body id=\"wordpress-org\" <?php if ( function_exists( 'body_class' ) ) { body_class(); } ?>/" $1/header.php
}

# Download the global WordPress.org footer into the given directory.
#
# This is a workaround because the footer isn't open-sourced yet
#
# $1 - the absolute path to the folder where the footer should be placed
function wme_pull_wporg_global_footer {
	curl -so $1/footer.php https://wordpress.org/footer.php

	sed -i "s/<\/body>/\n<?php\nif ( function_exists( 'gp_footer' ) ) {\n\tgp_footer();\n} else {\n\twp_footer();\n}\n?>\n\n&/" $1/footer.php
}

# Create log stubs
#
# $1 - the absolute path to the log folder
function wme_create_logs {
	if [ ! -d $1 ]; then
		mkdir $1
	fi

	touch $1/nginx-access.log
	touch $1/nginx-error.log
	touch $1/php-error.log
}

# Import a MySQL database
#
# $1 - the name of the database
# $2 - the absolute path to the folder where the $1.sql file is stored
function wme_import_database {
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS $1;"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON $1.* TO wp@localhost IDENTIFIED BY 'wp';"
	mysql -u root --password=root $1 < $2/$1.sql
}

# Warn users that we moved their cheese during the upgrade from SVN to Git
#
# See https://github.com/WordPress/meta-environment/issues/13
#
# $1 - the path to the site's public_html folder
function wme_svn_git_migration {
	if [[ ! -e $1 || -L $1 ]]; then
		return 0
	fi

	echo -e "\n\nWARNING: The Meta Environment now uses Git to track files in the Meta sites.\n"
	echo "Your current public_html folder will be backed up to public_html-old-svn-backup, and a new Git-based public_html folder will be provisioned."
	echo "If you're working on any unfinished patches, please copy them from the backup folder."
	echo -e "For help contributing with Git, see https://make.wordpress.org/meta/handbook/documentation/contributing-with-git/\n"

	mv $1 "$1-old-svn-backup"
	MIGRATED_TO_GIT=true
}

# Copy of VVV's noroot()
#
# We can't just use VVV's version because it's not available when manually running the provision scripts during
# development.
function wme_noroot() {
  sudo -EH -u "vagrant" "$@";
}

# Whether a site should be provisioned.
#
# $1 - domain of the site
function wme_provision_site {
	WME_SITE_ESCAPED=`echo ${1} | sed 's/\./\\\\./g'`
	WME_PROVISION_SITE=`get_config_value "provision_site.${WME_SITE_ESCAPED}" 'true'`
	echo ${WME_PROVISION_SITE,,}
}

# Loads mo/mo files from translate.wordpress.org.
#
# $1 - Slug of GlotPress locale
# $2 - Slug of GlotPress project
# $3 - File path without the PO/MO extension
function wme_download_pomo {
	local GPLOCALE=$1
	local GPPROJECT=$2
	local OUTPUT=$3

	curl -sfg -o $OUTPUT.po "https://translate.wordpress.org/projects/$GPPROJECT/$GPLOCALE/default/export-translations?filters[status]=current&format=po" || echo "Error downloading ${GPPROJECT}-${GPLOCALE}.po"
	curl -sfg -o $OUTPUT.mo "https://translate.wordpress.org/projects/$GPPROJECT/$GPLOCALE/default/export-translations?filters[status]=current&format=mo" || echo "Error downloading ${GPPROJECT}-${GPLOCALE}.mo"
}
