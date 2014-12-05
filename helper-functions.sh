#!/bin/bash

# Download the global WordPress.org header into the given directory and insert `wp_head()`
#
# This is a workaround because the header isn't open-sourced yet
#
# $1 - the absolute path to the folder where the header should be placed
function wme_pull_wporg_global_header {
	curl -o $1/header.php https://wordpress.org/header.php
	sed -i 's/<\/head>/\n<?php wp_head(); ?>\n\n&/' $1/header.php
}

# Download the global WordPress.org footer into the given directory and insert `wp_footer()`
#
# This is a workaround because the footer isn't open-sourced yet
#
# $1 - the absolute path to the folder where the footer should be placed
function wme_pull_wporg_global_footer {
	curl -o $1/footer.php https://wordpress.org/footer.php
	sed -i 's/<\/body>/\n<?php wp_footer(); ?>\n\n&/' $1/footer.php
}

# Create Nginx logs
#
# $1 - the absolute path to the log folder
function wme_create_nginx_logs {
	sudo mkdir $1
	sudo touch $1/access.log
	sudo touch $1/error.log
}
