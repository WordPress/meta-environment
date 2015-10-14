<?php
if ( ! isset( $_SERVER['HTTP_HOST'] ) ) {
	$_SERVER['HTTP_HOST'] = 'jobs.wordpressnet.dev';
}

$table_prefix  = 'wp_';

define( 'DB_NAME',               'jobs_wordpressnet_dev' );
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

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
