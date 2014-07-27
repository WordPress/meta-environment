<?php

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

// Load mu-plugins in subdirectories
define( 'WP_CORE_STABLE_BRANCH', '3.9' );
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
			'version'     => WP_CORE_STABLE_BRANCH,
			'zip_size_mb' => '6.4',
			'targz_url'   => 'download.tar.gz',
			'zip_url'     => 'download.zip',
			'tar_size_mb' => '5.9'
		);
	}

	public function get_releases_breakdown() {
		return array();
	}
}

$GLOBALS['rosetta'] = new Rosetta_WordPress();
