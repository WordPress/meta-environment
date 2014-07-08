<?php

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

// Load mu-plugins in subdirectories
define( 'WP_CORE_STABLE_BRANCH', '3.9' );
require_once( __DIR__ . '/downloads/rosetta-downloads.php' );
require_once( __DIR__ . '/roles/rosetta-roles.php' );
require_once( __DIR__ . '/showcase/rosetta-showcase.php' );
