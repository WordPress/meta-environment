<?php

ini_set( 'error_log', dirname( dirname( ABSPATH ) ) . '/logs/php-error.log' );

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

// Run site-specific functionality
switch( $_SERVER['HTTP_HOST'] ) {
	case 'developer.wordpressorg.dev':
		wme_developer_wordpressorg_dev();
		break;

	case 'global.wordpressorg.dev':
	case 'en.wordpressorg.dev':
	case 'es.wordpressorg.dev':
	case 'ja.wordpressorg.dev':
		wme_global_wordpressorg_dev();
		break;
}

/**
 * developer.wordpressorg.dev
 */
function wme_developer_wordpressorg_dev() {
	add_filter( 'show_admin_bar', '__return_false' );
}

/**
 * global.wordpressorg.dev
 */
function wme_global_wordpressorg_dev() {
	// Load mu-plugins in subdirectories
	define( 'WP_CORE_STABLE_BRANCH', '4.0' );
	require_once( __DIR__ . '/global_wordpressorg_dev/downloads/rosetta-downloads.php' );
	require_once( __DIR__ . '/global_wordpressorg_dev/roles/rosetta-roles.php' );
	require_once( __DIR__ . '/global_wordpressorg_dev/showcase/rosetta-showcase.php' );

	// Stub the Rosetta plugin until it's open-sourced, to avoid fatal PHP errors
	class Rosetta_WordPress {
		public $rosetta, $showcase, $locale;

		public function __construct() {
			$this->locale   = 'en';
			$this->rosetta  = new Rosetta();
			$this->showcase = new Rosetta_Showcase();
		}

		function screenshot_url( $url, $size ) {
			if ( 0 !== strpos( $url, 'http://' ) ) {
				$url = 'http://' . $url;
			}

			return 'http://s.wordpress.com/mshots/v1/' . urlencode( esc_url( $url ) ) . '?w=' . intval( $size );
		}
	}

	class Rosetta {
		public function get_latest_release() {
			return array(
				'version'     => WP_CORE_STABLE_BRANCH,
				'zip_size_mb' => '6.4',
				'targz_url'   => 'download.tar.gz',
				'zip_url'     => 'download.zip',
				'tar_size_mb' => '5.9',
			);
		}

		public function get_releases_breakdown() {
			return array();
		}
		
		public function get_latest_public_release() {
			return $this->get_latest_release();
		}
	}

	$GLOBALS['rosetta'] = new Rosetta_WordPress();
}
