<?php

if ( ! isset( $_SERVER['HTTP_HOST'] ) ) {
	$_SERVER['HTTP_HOST'] = 'wordpressorg.test';
}

$table_prefix  = 'wporg_';

define( 'WPORGPATH',              dirname( __FILE__ ) . '/' );
define( 'API_WPORGPATH',          dirname( dirname( dirname( __DIR__ ) ) ) . '/api.wordpress.org/public_html/includes/' );
define( 'WPORG_SANDBOXED',        true );

define( 'DB_NAME',                'wordpressorg_dev' );
define( 'DB_USER',                'wp' );
define( 'DB_PASSWORD',            'wp' );
define( 'DB_HOST',                'localhost' );
define( 'DB_COLLATE',             '' );

ini_set( 'log_errors',            'On' );
ini_set( 'display_errors',        'On' );
ini_set( 'error_reporting',       E_ALL );

define( 'WP_DEBUG',               true );
define( 'WP_DEBUG_LOG',           true );
define( 'WP_DEBUG_DISPLAY',       true );
define( 'SAVEQUERIES',            true );
define( 'JETPACK_DEV_DEBUG',      true );
define( 'SCRIPT_DEBUG',           true );

define( 'WPLANG',                 '' );
define( 'WP_CONTENT_DIR',         __DIR__ . '/wp-content' );
define( 'WP_CONTENT_URL',         'http://' . preg_replace( '/[^-_.0-9a-z:]/i', '', $_SERVER['HTTP_HOST'] ) . '/wp-content' );

define( 'AUTH_KEY',               'B<=-9r`TXvVa^Y0Y~8JnDye<H~@t3,k:<%My:QtMU|1pH(:7B76f:%O{AqGOMwhj' );
define( 'SECURE_AUTH_KEY',        '#vZ4tX7{67*.m]kh h[H .by&YAWrGs`Z%6;tyJ-1(@2KKxz6;>VQa^:/$%?9+_?' );
define( 'LOGGED_IN_KEY',          '5C:-K3>z,?K#CQ +A$7!]$;1A{gBiX+-DZzY()2a>;=g+zQ#@.5aYwR-.r73-r+3' );
define( 'NONCE_KEY',              'Npa lMe_;9u`DAAf_c7qnJdev#u|4g|bI^qmSFkJ*hXt,evt_rV0~C+)kM|{U3_T' );
define( 'AUTH_SALT',              'q -~]?|>qe:`:uV(ulnJ<bBVy[|@B<DkdRwhx%tWSfGyBrK.d[SvF2Rk(C=R){RI' );
define( 'SECURE_AUTH_SALT',       '+-,PoVE8!`#?O@Sv`X:Fhy~BzDt]{7}01o9#[_6tv#mLk5e}O[{[=uPZvwT[;V6^' );
define( 'LOGGED_IN_SALT',         '-O8.ClBi]awaLi$!c>3 L(:+Yi)L/fZ|m3DRyu1e-SYM`q2JZsG@zU|VtZBEqCH<' );
define( 'NONCE_SALT',             '|mk?Ht,|+:hQ&(+rb&uOxL*bIY&EL]M<@v-?dbxf!PB;&+3A4-/H.2~<q!69X.]|' );

define( 'COOKIEHASH',             md5( 'the future is unwritten' ) );
define( 'COOKIE_DOMAIN',          '.wordpressorg.test' );

define( 'LOGGED_IN_COOKIE',       'wporgdev_logged_in' );
define( 'AUTH_COOKIE',            'wporgdev' );
define( 'SECURE_AUTH_COOKIE',     'wporgdev_sec' );

define( 'MULTISITE',              true );

define( 'SUNRISE',                true );

define( 'WPORG_GLOBAL_NETWORK_ID',       6 );
define( 'WPORG_THEME_DIRECTORY_BLOGID',  35 );
define( 'WPORG_PLUGIN_DIRECTORY_BLOGID', 367 );
define( 'WPORG_TRANSLATE_BLOGID',        351 );
define( 'WPORG_SUPPORT_FORUMS_BLOGID',   368 );

// Used for /download
define( 'WP_CORE_LATEST_RELEASE',        '5.4' );
define( 'RECOMMENDED_PHP',         		 7.1 );


// Disable WordPress Cron, we've got Cavalcade processing jobs instead.
define( 'DISABLE_WP_CRON', true );

define( 'GLOTPRESS_LOCALES_PATH', dirname( dirname( dirname( __DIR__ ) ) ) . '/meta-repository/wordpress.org/public_html/wp-content/plugins/glotpress/locales/locales.php' );
define( 'GLOTPRESS_TABLE_PREFIX', 'translate_' );

if ( $_SERVER['HTTP_HOST'] === 'make.wordpressorg.test' ) {
	define( 'DOMAIN_CURRENT_SITE',  'make.wordpressorg.test' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 2 );
	define( 'BLOG_ID_CURRENT_SITE', 4 );
	define( 'SUBDOMAIN_INSTALL',    false );
	define( 'WP_DEFAULT_THEME',     'pub/wporg-p2' );

} elseif ( $_SERVER['HTTP_HOST'] === 'learn.wordpressorg.test' ) {
	define( 'DOMAIN_CURRENT_SITE',  'learn.wordpressorg.test' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 3 );
	define( 'BLOG_ID_CURRENT_SITE', 7 );
	define( 'SUBDOMAIN_INSTALL',    false );

} elseif ( $_SERVER['HTTP_HOST'] == 'developer.wordpressorg.test' ) {
	define( 'DOMAIN_CURRENT_SITE',  'developer.wordpressorg.test' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 5 );
	define( 'BLOG_ID_CURRENT_SITE', 33 );

} elseif ( $_SERVER['HTTP_HOST'] === 'wordpressorg.test' ) {
	define( 'DOMAIN_CURRENT_SITE',  'wordpressorg.test' );
	define( 'PATH_CURRENT_SITE',    '/' );
	define( 'SITE_ID_CURRENT_SITE', 1 );
	define( 'BLOG_ID_CURRENT_SITE', 1 );
	define( 'SUBDOMAIN_INSTALL',    false );
	define( 'WP_DEFAULT_THEME',     'pub/wporg-main' );

} elseif ( $_SERVER['HTTP_HOST'] === 'translate.wordpressorg.test' ) {
	define( 'DB_CHARSET', 'latin1' );
	define( 'GP_TMPL_PATH',  WPORGPATH . 'wp-content/plugins/wporg-gp-customizations/templates/' );
	define( 'GP_URL_BASE', '' );
	$gp_table_prefix = GLOTPRESS_TABLE_PREFIX;

} else {
	// global.wordpressorg.test
	define( 'WP_LANG_URL',          WP_CONTENT_URL . '/languages' );
	define( 'WP_DEFAULT_THEME',     'rosetta' );
	define( 'NOBLOGREDIRECT',       'http://wordpressorg.test/' );
	define( 'DEPLOYER_EMAIL',       'foo@example.org' );
	define( 'SITE_ID_CURRENT_SITE', 6 );
	define( 'BLOG_ID_CURRENT_SITE', 115 );
	define( 'SUBDOMAIN_INSTALL',    true );
}

if ( ! defined( 'DB_CHARSET' ) ) {
	define( 'DB_CHARSET', 'utf8' );
}

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
