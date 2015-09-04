<?php

$gp_table_prefix = 'translate_';

define( 'WPORGPATH',             __DIR__ . '/' );
define( 'WPORG_SANDBOXED',       true );

define( 'GPDB_NAME',             'wordpressorg_dev' );
define( 'GPDB_USER',             'wp' );
define( 'GPDB_PASSWORD',         'wp' );
define( 'GPDB_HOST',             'localhost' );
define( 'GPDB_CHARSET',          'utf8' );
define( 'GPDB_COLLATE',          '' );

define( 'GP_AUTH_KEY',           'B<=-9r`TXvVa^Y0Y~8JnDye<H~@t3,k:<%My:QtMU|1pH(:7B76f:%O{AqGOMwhj' );
define( 'GP_SECURE_AUTH_KEY',    '#vZ4tX7{67*.m]kh h[H .by&YAWrGs`Z%6;tyJ-1(@2KKxz6;>VQa^:/$%?9+_?' );
define( 'GP_LOGGED_IN_KEY',      '5C:-K3>z,?K#CQ +A$7!]$;1A{gBiX+-DZzY()2a>;=g+zQ#@.5aYwR-.r73-r+3' );
define( 'GP_NONCE_KEY',          'Npa lMe_;9u`DAAf_c7qnJdev#u|4g|bI^qmSFkJ*hXt,evt_rV0~C+)kM|{U3_T' );
define( 'GP_AUTH_SALT',          'q -~]?|>qe:`:uV(ulnJ<bBVy[|@B<DkdRwhx%tWSfGyBrK.d[SvF2Rk(C=R){RI' );
define( 'GP_SECURE_AUTH_SALT',   '+-,PoVE8!`#?O@Sv`X:Fhy~BzDt]{7}01o9#[_6tv#mLk5e}O[{[=uPZvwT[;V6^' );
define( 'GP_LOGGED_IN_SALT',     '-O8.ClBi]awaLi$!c>3 L(:+Yi)L/fZ|m3DRyu1e-SYM`q2JZsG@zU|VtZBEqCH<' );
define( 'GP_NONCE_SALT',         '|mk?Ht,|+:hQ&(+rb&uOxL*bIY&EL]M<@v-?dbxf!PB;&+3A4-/H.2~<q!69X.]|' );

define( 'GP_COOKIE_DOMAIN',      '.wordpressorg.dev' );

define( 'GP_AUTH_COOKIE',        'wporgdev' );
define( 'GP_SECURE_AUTH_COOKIE', 'wporgdev_sec' );
define( 'GP_LOGGED_IN_COOKIE',   'wporgdev_logged_in' );

define( 'GP_DEBUG',              true );

define( 'GP_PLUGINS_PATH',       __DIR__ . '/gp-plugins/' );
define( 'GP_TMPL_PATH',          __DIR__ . '/gp-templates/' );

define( 'GP_URL',                'http://translate.wordpressorg.dev/' );
define( 'GP_BASE_URL',           'http://translate.wordpressorg.dev/glotpress/' );

define( 'CUSTOM_USER_TABLE',      'wporg_users' );
define( 'CUSTOM_USER_META_TABLE', 'wporg_usermeta' );
