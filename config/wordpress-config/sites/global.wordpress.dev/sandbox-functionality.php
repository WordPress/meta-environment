<?php

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

// Load mu-plugins in subdirectories
define( 'WP_CORE_STABLE_BRANCH', '3.9' );
define( 'WP_CORE_ZIP_SIZE', '6.4' );
define( 'WP_CORE_TAR_URL', 'download.tar.gz' );
define( 'WP_CORE_ZIP_URL', 'download.zip' );
define( 'WP_CORE_TAR_SIZE', '5.9' );
require_once( __DIR__ . '/downloads/rosetta-downloads.php' );
require_once( __DIR__ . '/roles/rosetta-roles.php' );
require_once( __DIR__ . '/showcase/rosetta-showcase.php' );

// Stub the Rosetta plugin until it's open-sourced, to avoid fatal PHP errors
class Rosetta_WordPress {
	public $rosetta, $showcase, $locale;

	public function __construct() {
		$this->locale   = 'en';
		$this->rosetta  = new Rosetta();
		$this->showcase = new Rosetta_Showcase();
	}
}

class Rosetta {
	public function get_latest_release() {

		// Expected to be an array containing version, zip_size_mb, targz_url, zip_url, tar_size_mb
		return array(
			'version' 		=> WP_CORE_STABLE_BRANCH,
			'zip_size_mb' 	=> WP_CORE_ZIP_SIZE,
			'targz_url' 	=> WP_CORE_TAR_URL,
			'zip_url' 		=> WP_CORE_ZIP_URL,
			'tar_size_mb' 	=> WP_CORE_TAR_SIZE
		);

	}

	public function get_releases_breakdown() {
		return array();
	}
}

$GLOBALS['rosetta'] = new Rosetta_WordPress();
