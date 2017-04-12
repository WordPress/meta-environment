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

# Add entries to a .gitignore file
#
# todo use .git/info/exclude instead, that's more appropriate for this situation
#
# $1 - the site's web root
function wme_create_gitignore {
	# Ignore the .gitignore file itself
	echo "/.gitignore" >> $1/.gitignore

	for i in "${IGNORED_FILES[@]}"
	do :
		echo "$i" >> $1/.gitignore
	done
}

# Download the global WordPress.org header into the given directory.
#
# This is a workaround because the header isn't open-sourced yet
#
# $1 - the absolute path to the folder where the header should be placed
# $2 - optionally, the function which should be added to the header
function wme_pull_wporg_global_header {
	curl -o $1/header.php --progress-bar https://wordpress.org/header.php

	if [ ! -z "$2" ]; then
		sed -i "s/<\/head>/\n<?php $2(); ?>\n\n&/" $1/header.php
	fi

	sed -i "s/<body id=\"wordpress-org\"/<body id=\"wordpress-org\" <?php if ( function_exists( 'body_class' ) ) { body_class(); } ?>/" $1/header.php
}

# Download the global WordPress.org footer into the given directory.
#
# This is a workaround because the footer isn't open-sourced yet
#
# $1 - the absolute path to the folder where the footer should be placed
# $2 - optionally, the function which should be added to the footer
function wme_pull_wporg_global_footer {
	curl -o $1/footer.php --progress-bar https://wordpress.org/footer.php

	if [ ! -z "$2" ]; then
		sed -i "s/<\/body>/\n<?php $2(); ?>\n\n&/" $1/footer.php
	fi
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
