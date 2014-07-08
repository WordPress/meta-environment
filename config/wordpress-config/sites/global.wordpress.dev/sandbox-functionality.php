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
		return WP_CORE_STABLE_BRANCH;
	}
}

$GLOBALS['rosetta'] = new Rosetta_WordPress();
