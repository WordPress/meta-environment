<?php

$table_prefix  = 'wporg_';

define( 'WPORGPATH',             dirname( __FILE__ ) . '/' );
define( 'WPORG_SANDBOXED',       true );

define( 'DB_NAME',               'wordpress_dev' );
define( 'DB_USER',               'wp' );
define( 'DB_PASSWORD',           'wp' );
define( 'DB_HOST',               'localhost' );
define( 'DB_CHARSET',            'utf8' );
define( 'DB_COLLATE',            '' );

ini_set( 'log_errors',           'On' );
ini_set( 'display_errors',       'On' );
ini_set( 'error_reporting',      E_ALL );

define( 'WP_DEBUG',              true );
define( 'WP_DEBUG_LOG',          true );
define( 'WP_DEBUG_DISPLAY',      true );
define( 'SAVEQUERIES',           true );
define( 'JETPACK_DEV_DEBUG',     true );
define( 'SCRIPT_DEBUG',          true );

define( 'WPLANG',                '' );
define( 'WP_CONTENT_DIR',        __DIR__ . '/wp-content' );
define( 'WP_CONTENT_URL',        'http://' . preg_replace( '/[^-_.0-9a-z:]/i', '', $_SERVER['HTTP_HOST'] ) . '/wp-content' );

define( 'MULTISITE',             true );

if ( $_SERVER['HTTP_HOST'] === 'make.wordpress.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'make.wordpress.dev' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 2 );
	define( 'BLOG_ID_CURRENT_SITE', 4 );
	define( 'SUBDOMAIN_INSTALL',    false );
	define( 'WP_DEFAULT_THEME',     'pub/wporg-p2' );

} elseif ( $_SERVER['HTTP_HOST'] === 'learn.wordpress.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'learn.wordpress.dev' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 3 );
	define( 'BLOG_ID_CURRENT_SITE', 7 );
	define( 'SUBDOMAIN_INSTALL',    false );

} elseif ( $_SERVER['HTTP_HOST'] === 'wordpress.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'wordpress.dev' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 1 );
	define( 'BLOG_ID_CURRENT_SITE', 1 );
	define( 'SUBDOMAIN_INSTALL',    false );
}

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
