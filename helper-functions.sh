#!/bin/bash

# Download the global WordPress.org header into the given directory.
#
# This is a workaround because the header isn't open-sourced yet
#
# $1 - the absolute path to the folder where the header should be placed
# $2 - the function which should be added to the header
function wme_pull_wporg_global_header {
	curl -o $1/header.php https://wordpress.org/header.php
	if [ ! -z "$2" ]; then
		sed -i "s/<\/head>/\n<?php $2(); ?>\n\n&/" $1/header.php
	fi
}

# Download the global WordPress.org footer into the given directory.
#
# This is a workaround because the footer isn't open-sourced yet
#
# $1 - the absolute path to the folder where the footer should be placed
# $2 - the function which should be added to the footer
function wme_pull_wporg_global_footer {
	curl -o $1/footer.php https://wordpress.org/footer.php
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
