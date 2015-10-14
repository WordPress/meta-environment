<?php
if ( ! isset( $_SERVER['HTTP_HOST'] ) ) {
	$_SERVER['HTTP_HOST'] = 'buddypressorg.dev';
}

$table_prefix  = 'wp_';

define( 'DB_NAME',               'buddypressorg_dev' );
define( 'DB_USER',               'wp' );
define( 'DB_PASSWORD',           'wp' );
define( 'DB_HOST',               'localhost' );
define( 'DB_CHARSET',            'utf8' );
define( 'DB_COLLATE',            '' );

ini_set( 'log_errors',           'On' );
ini_set( 'display_errors',       'On' );
ini_set( 'error_reporting',      E_ALL );

define( 'WP_DEBUG',              true );
define( 'WP_DEBUG_DISPLAY',      true );
define( 'SAVEQUERIES',           true );
define( 'SCRIPT_DEBUG',          true );

define( 'WP_CONTENT_DIR',        __DIR__ . '/wp-content' );
define( 'WP_CONTENT_URL',        'http://' . preg_replace( '/[^-_.0-9a-z:]/i', '', $_SERVER['HTTP_HOST'] ) . '/wp-content' );

define( 'AUTH_KEY',              'B<=-9r`TXvVa^Y0Y~8JnDye<H~@t3,k:<%My:QtMU|1pH(:7B76f:%O{AqGOMwhj' );
define( 'SECURE_AUTH_KEY',       '#vZ4tX7{67*.m]kh h[H .by&YAWrGs`Z%6;tyJ-1(@2KKxz6;>VQa^:/$%?9+_?' );
define( 'LOGGED_IN_KEY',         '5C:-K3>z,?K#CQ +A$7!]$;1A{gBiX+-DZzY()2a>;=g+zQ#@.5aYwR-.r73-r+3' );
define( 'NONCE_KEY',             'Npa lMe_;9u`DAAf_c7qnJdev#u|4g|bI^qmSFkJ*hXt,evt_rV0~C+)kM|{U3_T' );
define( 'AUTH_SALT',             'q -~]?|>qe:`:uV(ulnJ<bBVy[|@B<DkdRwhx%tWSfGyBrK.d[SvF2Rk(C=R){RI' );
define( 'SECURE_AUTH_SALT',      '+-,PoVE8!`#?O@Sv`X:Fhy~BzDt]{7}01o9#[_6tv#mLk5e}O[{[=uPZvwT[;V6^' );
define( 'LOGGED_IN_SALT',        '-O8.ClBi]awaLi$!c>3 L(:+Yi)L/fZ|m3DRyu1e-SYM`q2JZsG@zU|VtZBEqCH<' );
define( 'NONCE_SALT',            '|mk?Ht,|+:hQ&(+rb&uOxL*bIY&EL]M<@v-?dbxf!PB;&+3A4-/H.2~<q!69X.]| ');

define( 'COOKIEHASH',            md5( 'the future is a pizza' ) );
define( 'WP_ALLOW_MULTISITE',    true );
define( 'MULTISITE',             true );
define( 'SUBDOMAIN_INSTALL',     true );

define( 'PATH_CURRENT_SITE',     '/' );
define( 'SITE_ID_CURRENT_SITE',  1 );
define( 'BLOG_ID_CURRENT_SITE',  1 );  // BuddyPress.org
define( 'BP_ENABLE_MULTIBLOG',   true );

if ( $_SERVER['HTTP_HOST'] === 'buddypressorg.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'buddypressorg.dev' );

} elseif ( $_SERVER['HTTP_HOST'] === 'codex.buddypressorg.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'codex.buddypressorg.dev' );

} elseif ( $_SERVER['HTTP_HOST'] === 'es.buddypressorg.dev' ) {
	define( 'DOMAIN_CURRENT_SITE', 'es.buddypressorg.dev' );

} elseif ( $_SERVER['HTTP_HOST'] === 'codex.bbpressorg.dev' ) {
	define( 'DOMAIN_CURRENT_SITE',  'codex.bbpressorg.dev' );
}

if ( $_SERVER['HTTP_HOST'] === 'codex.bbpressorg.dev' ) {
	define( 'COOKIE_DOMAIN', 'codex.bbpressorg.dev' );
} else {
	define( 'COOKIE_DOMAIN', '.buddypressorg.dev' );
}


// Begin sanity warning

if ( $_SERVER['HTTP_HOST'] !== 'profiles.wordpressorg.dev' ) {
	define( 'AUTH_COOKIE',      'buddyorg'           );
	define( 'LOGGED_IN_COOKIE', 'buddyorg_logged_in' );
}

// End sanity warning


if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
